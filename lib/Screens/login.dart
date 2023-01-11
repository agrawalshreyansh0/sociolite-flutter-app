// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';
import 'package:sociolite/widgets/custom_button_1.dart';

import 'package:sociolite/widgets/custom_layout_1.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Layout1(
      header: "Log In",
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
          Spacer(),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Email can not be empty";
              }
              return null;
            },
            controller: email,
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
                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
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
            controller: password,
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
                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
              ),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: MyTheme.primary),
            ),
          ),
          Spacer(),
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
              "Forgot the password?",
              style: TextStyle(
                  fontSize: 15,
                  color: MyTheme.primary,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
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
          Spacer(),
          CustomButton1(text: 'Login with google'),
          Spacer(),
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
                      fontSize: 16),
                ),
              )
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}

login(BuildContext context) {
  Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
}
