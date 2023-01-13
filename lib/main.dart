// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sociolite/Screens/home.dart';
import 'package:sociolite/Screens/login.dart';
import 'package:sociolite/Screens/onboarding.dart';
import 'package:sociolite/Screens/signup.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.onboarding: (context) => Onboarding(),
        MyRoutes.signUp: (context) => SignUp(),
        MyRoutes.logIn: (context) => LoginPage(),
      },
    );
  }
}
