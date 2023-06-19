import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_bank/res/colors/colors.dart';
import 'package:my_bank/res/colors/material_color_generator.dart';
import 'package:my_bank/screens/users_screen/view/users_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColorGenerator.from(AppColors.primary),
      ),
      home: const UsersScreen(),
    );
  }
}