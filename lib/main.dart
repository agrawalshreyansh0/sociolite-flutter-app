import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/Screens/add_post.dart';
import 'package:sociolite/Screens/comments.dart';
import 'package:sociolite/Screens/edit_profile.dart';
import 'package:sociolite/Screens/friend_requests.dart';
import 'package:sociolite/Screens/friends.dart';
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

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    verifyToken();
  }

  bool isVerified = false;

  Future<Widget> verifyToken() async {
    bool isVerified = await UserService.verifyToken();
    if (isVerified) {
      return const Home();
    } else {
      return const LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => PostsProvider()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<Widget>(
          future: verifyToken(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return snapshot.data ?? const LoginPage();
            }
          },
        ),
        routes: {
          MyRoutes.homeRoute: (context) => const Home(),
          MyRoutes.onboarding: (context) => const Onboarding(),
          MyRoutes.signUp: (context) => const SignUp(),
          MyRoutes.logIn: (context) => const LoginPage(),
          MyRoutes.addPost: (context) => const AddPost(),
          MyRoutes.settings: (context) => const Settings(),
          MyRoutes.comments: (context) => const Comments(),
          MyRoutes.editProfile: (context) => const EditProfile(),
          MyRoutes.friendRequests: (context) => const FriendRequests(),
          MyRoutes.friends :(context) => const Friends(), 
          MyRoutes.notifications: (context) => const Notifications(),
        },
      ),
    );
  }
}
