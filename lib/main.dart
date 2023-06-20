import 'package:flutter/material.dart';
import 'package:my_bank/app.dart';
import 'package:my_bank/common/modules/user.dart';
import 'package:my_bank/services/database_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await DatabaseService.instance.updateUser(
  //   User(
  //     id: "9",
  //     name: "Sara",
  //     email: "Sara@gmail.com",
  //     currentBalance: 5000,
  //   ),
  // );

  runApp(const MyApp());
}
