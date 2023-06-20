import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:my_bank/common/modules/user.dart';
import 'package:my_bank/res/colors/colors.dart';
import 'package:my_bank/screens/transfer_money_screen/view_model/transfer_money_view_model.dart';
import 'package:my_bank/screens/users_screen/view/widgets/user_item.dart';
import 'package:provider/provider.dart';

class TransferMoneyScreen extends StatelessWidget {
  final User fromUser;

  const TransferMoneyScreen({
    super.key,
    required this.fromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Transfer Money'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => TransferMoneyViewModel(fromUser),
          builder: (context, child) {
            var viewModel = Provider.of<TransferMoneyViewModel>(
              context,
              listen: true,
            );
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("From user:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: UserItem(
                      user: fromUser,
                      hasOnClick: false,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (viewModel.toUser != null) ...[
                    const Text("To user:"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: UserItem(
                        user: viewModel.toUser!,
                        hasOnClick: false,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  getAmountTextField(viewModel),
                  const SizedBox(height: 12),
                  getUsersDropdownMenu(viewModel),
                  getTransferButton(viewModel),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getAmountTextField(TransferMoneyViewModel viewModel) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        CurrencyTextInputFormatter(
          decimalDigits: 1,
          symbol: "\$ ",
          turnOffGrouping: true,
        ),
      ],
      decoration: InputDecoration(
          errorText: viewModel.error,
          hintText: "Amount",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppColors.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          label: const Text("Amount"),
          floatingLabelAlignment: FloatingLabelAlignment.center),
      textAlign: TextAlign.center,
      maxLines: 1,
      onChanged: (value) {
        viewModel.onAmountChanged(value);
      },
    );
  }

  Widget getUsersDropdownMenu(TransferMoneyViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: DropdownButton(
            items: viewModel.users.map<DropdownMenuItem<User>>((User user) {
              return DropdownMenuItem<User>(
                value: user,
                child: Text(user.name),
              );
            }).toList(),
            onChanged: (value) {
              viewModel.onToUserSelected(value!);
            },
            value: viewModel.toUser ??
                (viewModel.users.isNotEmpty ? viewModel.users.first : null),
          ),
        ),
      ],
    );
  }

  Widget getTransferButton(TransferMoneyViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              viewModel.onTransferMoneyClicked();
            },
            child: const Text("Transfer Money"),
          ),
        ),
      ],
    );
  }
}
