import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociolite/Screens/add_post.dart';
import 'package:sociolite/Screens/comments.dart';
import 'package:sociolite/Screens/home.dart';
import 'package:sociolite/Screens/login.dart';
import 'package:sociolite/Screens/notifications.dart';
import 'package:sociolite/Screens/onboarding.dart';
import 'package:sociolite/Screens/settings.dart';
import 'package:sociolite/Screens/signup.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/providers/post_provider.dart';
import 'package:sociolite/services/auth_services.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';

import 'models/main_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => PostsProvider()),
    ],
    child: MyApp(
      isLoggedIn: isLoggedIn,
    ),
  ));
}

class MyApp extends StatefulWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    log("hey init state");
    verifyToken();
  }

  bool isVerified = false;

  Future<Widget> verifyToken() async {
    bool isVerified = await UserService.verifyToken();
    log(isVerified.toString());
    if (isVerified) {
      return Home();
    } else {
      return LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    log("hey build method");
    MainUser temp = Provider.of<UserProvider>(context, listen: false).user;
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<Widget>(
        future: verifyToken(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return snapshot.data ?? LoginPage(); 
          }
        },
      ),
      // initialRoute: FutureBuilder<String?>(),

      // MyRoutes.homeRoute,
      // widget.isLoggedIn ? MyRoutes.homeRoute : MyRoutes.onboarding,
      // temp.id.isNotEmpty ? MyRoutes.onboarding : MyRoutes.homeRoute,
      // isVerified ? MyRoutes.homeRoute : MyRoutes.logIn,

      routes: {
        MyRoutes.homeRoute: (context) => const Home(),
        MyRoutes.onboarding: (context) => const Onboarding(),
        MyRoutes.signUp: (context) => const SignUp(),
        MyRoutes.logIn: (context) => const LoginPage(),
        MyRoutes.addPost: (context) => const AddPost(),
        MyRoutes.settings: (context) => const Settings(),
        MyRoutes.comments: (context) => const Comments(),
        MyRoutes.notifications: (context) => const Notifications(),
      },
    );
  }
}
