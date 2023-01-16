// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociolite/Screens/add_post.dart';
import 'package:sociolite/Screens/home.dart';
import 'package:sociolite/Screens/login.dart';
import 'package:sociolite/Screens/onboarding.dart';
import 'package:sociolite/Screens/settings.dart';
import 'package:sociolite/Screens/signup.dart';
import 'package:sociolite/providers/post_provider.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostsProvider()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedIn ? MyRoutes.homeRoute : MyRoutes.logIn,
        routes: {
          MyRoutes.homeRoute: (context) => Home(),
          MyRoutes.onboarding: (context) => Onboarding(),
          MyRoutes.signUp: (context) => SignUp(),
          MyRoutes.logIn: (context) => LoginPage(),
          MyRoutes.addPost: (context) => AddPost(),
          MyRoutes.settings: (context) => Settings(),
        },
      ),
    );
  }
}
