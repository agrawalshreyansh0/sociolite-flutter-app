// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociolite/services/auth_services.dart';
import 'package:sociolite/widgets/custom_button_1.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';
import '../models/user.dart';
import '../utils/themes.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signUpKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  void createUserAccount(BuildContext context) async {
    if (!_signUpKey.currentState!.validate()) {
      return;
    }
    if (!(_confirmPassword.text == _password.text)) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password does not match"),
      ));
      return;
    }
    User newUser =
        User( name: _name.text, email: _email.text, password: _password.text);
    Map response = await UserService.createUser(newUser);
    log(response.toString());
    String message = response["message"].toString();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
    if (response["success"]) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout1(
        header: "Create Account",
        child: SingleChildScrollView(
          child: Form(
            key: _signUpKey,
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
                  "Create Account to keep exploring amazing destinations around the world!",
                  style: TextStyle(color: MyTheme.text2, fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name can not be empty";
                    }
                    return null;
                  },
                  controller: _name,
                  cursorColor: Colors.black,
                  style: TextStyle(height: 1),
                  decoration: InputDecoration(
                    hintText: "Enter your full name",
                    prefixIcon: Icon(
                      CupertinoIcons.person,
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
                  cursorColor: Colors.black,
                  controller: _email,
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
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 0, color: Colors.grey.shade100),
                    ),
                    errorBorder: OutlineInputBorder(
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
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 0, color: Colors.grey.shade100),
                    ),
                    errorBorder: OutlineInputBorder(
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
                  controller: _confirmPassword,
                  cursorColor: Colors.black,
                  style: TextStyle(height: 1),
                  decoration: InputDecoration(
                    hintText: "Confirm Your password",
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
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 0, color: Colors.grey.shade100),
                    ),
                    errorBorder: OutlineInputBorder(
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
                  height: 60,
                ),
                GestureDetector(
                  onTap: (() {
                    createUserAccount(context);
                  }),
                  child: CustomButton1(
                    text: 'Create Account',
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        " Sign in",
                        style: TextStyle(
                            color: MyTheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Center(
                    child: Text(
                  "By creating an account, you agree to our",
                  style: TextStyle(fontSize: 15),
                )),
                Row(
                  children: [
                    Text(
                      "Terms & Conditions",
                      style: TextStyle(fontSize: 15, color: MyTheme.primary),
                    ),
                    Text(
                      " and agree to ",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 15, color: MyTheme.primary),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ));
  }
}
