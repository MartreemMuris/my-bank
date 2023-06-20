import 'package:flutter/material.dart';
import 'package:my_bank/common/modules/user.dart';
import 'package:my_bank/services/database_service.dart';

class TransferMoneyViewModel extends ChangeNotifier {
  User fromUser;
  User? toUser;
  double amountToTransfer = 0;
  String? error;
  List<User> users = [];

  TransferMoneyViewModel(this.fromUser) {
    DatabaseService.instance.getAllUsers().then(
      (users) {
        this.users = users;
        users.removeWhere((user) => user.id == fromUser.id);
        notifyListeners();
      },
    );
  }

  onAmountChanged(String value) {
    if (value.isEmpty) {
      amountToTransfer = 0;
      return;
    }
    amountToTransfer = double.parse(value.split(" ").last);
    if (amountToTransfer > fromUser.currentBalance) {
      error = "You don't have this amount in your balance.";
    } else {
      error = null;
    }
    notifyListeners();
  }

  onToUserSelected(User user) {
    toUser = user;
    notifyListeners();
  }

  void onTransferMoneyClicked() async {
    if (error == null && toUser != null) {
      fromUser.currentBalance -= amountToTransfer;
      toUser!.currentBalance += amountToTransfer;
      await DatabaseService.instance.updateUser(fromUser);
      await DatabaseService.instance.updateUser(toUser!);
      notifyListeners();
    }
  }
}
