// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociolite/utils/themes.dart';

import 'package:sociolite/widgets/custom_layout_1.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();

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
            style: TextStyle(color: MyTheme.text2),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Name can not be empty";
              }
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
                return "Name can not be empty";
              }
            },
            controller: _email,
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
        ],
      ),
    );
  }
}
