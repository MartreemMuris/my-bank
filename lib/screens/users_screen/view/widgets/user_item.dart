import 'package:flutter/material.dart';
import 'package:my_bank/common/modules/user.dart';
import 'package:my_bank/res/colors/colors.dart';
import 'package:my_bank/screens/transfer_money_screen/view/transfer_money_screen.dart';

class UserItem extends StatelessWidget {
  final User user;
  final bool hasOnClick;

  const UserItem({
    super.key,
    required this.user,
    this.hasOnClick = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasOnClick
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransferMoneyScreen(
                    fromUser: user,
                  ),
                ),
              );
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user.email,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${user.currentBalance} \$",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
