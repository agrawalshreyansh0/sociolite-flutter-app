import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociolite/services/auth_services.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';
import 'package:sociolite/widgets/custom_button_1.dart';

import 'package:sociolite/widgets/custom_layout_1.dart';

import '../models/user.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final logInKey = GlobalKey<FormState>();

    void goolgeLogin() {}

    void showsnackbar(String message, BuildContext context) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    void login(BuildContext context) async {
      if (!logInKey.currentState!.validate()) {
        return;
      }
      Map response = await UserService.signIn(email.text, password.text);
      showsnackbar(response["message"], context);
      if (response["success"]) {
        String token = response["data"]["token"];
        User currentUser =
            User.fromMap(response["data"]["userdata"] as Map<String, dynamic>);
        final prefs = await SharedPreferences.getInstance();
        log(currentUser.id.toString());
        log(currentUser.name.toString());
        await prefs.setString('userId', currentUser.id.toString());
        await prefs.setString("userName", currentUser.name.toString());
        await prefs.setString('token', token);
        await prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
      }
    }

    return Layout1(
      header: "Log In",
      child: SingleChildScrollView(
        child: Form(
          key: logInKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyle(color: MyTheme.text2, fontSize: 15),
              ),
              const SizedBox(
                height: 60,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email can not be empty";
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.toString());
                  if (!emailValid) {
                    return "Invalid Email Format";
                  }
                  return null;
                },
                controller: email,
                cursorColor: Colors.black,
                style: const TextStyle(height: 1),
                decoration: InputDecoration(
                  hintText: "Enter your Email address",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: MyTheme.icon2,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade100),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade100),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade100),
                  ),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: MyTheme.primary),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password can not be empty";
                  }
                  return null;
                },
                controller: password,
                cursorColor: Colors.black,
                style: const TextStyle(height: 1),
                decoration: InputDecoration(
                  hintText: "Enter password",
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: MyTheme.icon2,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade100),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade100),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.shade100),
                  ),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: MyTheme.primary),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: (() {
                  login(context);
                }),
                child: const CustomButton1(
                  text: 'LogIn',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                      fontSize: 15,
                      color: MyTheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: MyTheme.grey,
                    endIndent: 20,
                  )),
                  const Text(
                    "or continue with",
                    style: TextStyle(fontSize: 16),
                  ),
                  Expanded(
                      child: Divider(
                    color: MyTheme.grey,
                    indent: 20,
                  )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    goolgeLogin();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyTheme.grey)),
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK5q0FP74VV9wbfwP378_7kj7iDomHuKrxkXsxDdUT28V9dlVMNUe-EMzaLwaFhneeuZI&usqp=CAU"),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.signUp);
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                        color: MyTheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
