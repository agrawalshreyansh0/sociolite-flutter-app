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
        initialRoute: isLoggedIn ? MyRoutes.homeRoute : MyRoutes.onboarding,
        routes: {
          MyRoutes.homeRoute: (context) => const Home(),
          MyRoutes.onboarding: (context) => const Onboarding(),
          MyRoutes.signUp: (context) => const SignUp(),
          MyRoutes.logIn: (context) => const LoginPage(),
          MyRoutes.addPost: (context) => const AddPost(),
          MyRoutes.settings: (context) => const Settings(),
          MyRoutes.comments: (context) =>  const Comments(),
          MyRoutes.notifications: (context) => const Notifications(),
        },
      ),
    );
  }
}
