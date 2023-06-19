import 'package:flutter/material.dart';
import 'package:my_bank/screens/users_screen/view/widgets/user_item.dart';
import 'package:my_bank/screens/users_screen/view_model/users_screen_view_model.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
            create: (context) => UsersScreenViewModel(),
            builder: (context, child) {
              var viewModel = Provider.of<UsersScreenViewModel>(
                context,
                listen: true,
              );
              return ListView(
                children: viewModel.users
                    .map((user) => UserItem(user: user))
                    .toList(),
              );
            }),
      ),
    );
  }
}
