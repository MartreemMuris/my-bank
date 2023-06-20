import 'package:flutter/material.dart';
import 'package:my_bank/common/modules/user.dart';
import 'package:my_bank/services/database_service.dart';

class UsersScreenViewModel extends ChangeNotifier {
  List<User> users = [
    // User(
    //   id: "1",
    //   name: "Martreem Muris",
    //   email: "martremmuris@gmail.com",
    //   currentBalance: 21000,
    // ),
  ];

  UsersScreenViewModel() {
    DatabaseService.instance.getAllUsers().then(
      (users) {
        this.users = users;
        notifyListeners();
      },
    );
  }
}
