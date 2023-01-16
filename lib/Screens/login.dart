// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociolite/services/auth_services.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';
import 'package:sociolite/widgets/custom_button_1.dart';

import 'package:sociolite/widgets/custom_layout_1.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    final _logInKey = GlobalKey<FormState>();

    void goolgeLogin() {}

    void login(BuildContext context) async {
      if (!_logInKey.currentState!.validate()) {
        return;
      }
      Map response = await UserService.signIn(_email.text, _password.text);
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: response["message"].text));
      if (response["success"]) {
        String token = response["data"]["token"];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        final String? newtoken = await prefs.getString('token') ??"Whatever bro" ; 
        Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
      }
    }

    return Layout1(
      header: "Log In",
      child: SingleChildScrollView(
        child: Form(
          key: _logInKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyle(color: MyTheme.text2, fontSize: 15),
              ),
              SizedBox(
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
                controller: _email,
                cursorColor: Colors.black,
                style: TextStyle(height: 1),
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
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password can not be empty";
                  }
                  return null;
                },
                controller: _password,
                cursorColor: Colors.black,
                style: TextStyle(height: 1),
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
              SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: (() {
                  login(context);
                }),
                child: CustomButton1(
                  text: 'LogIn',
                ),
              ),
              SizedBox(
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
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: MyTheme.grey,
                    endIndent: 20,
                  )),
                  Text(
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
              SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    goolgeLogin();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
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
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
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
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
