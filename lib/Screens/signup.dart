// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociolite/widgets/custom_button_1.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

import '../utils/routes.dart';
import '../utils/themes.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout1(
        header: "Create Account",
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
                  return "Email can not be empty";
                }
                return null;
              },
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
                  return "Email can not be empty";
                }
                return null;
              },
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
              cursorColor: Colors.black,
              style: TextStyle(height: 1),
              decoration: InputDecoration(
                hintText: "Enter confirm password",
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
                    Navigator.pushNamed(context, MyRoutes.signUp);
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
            Spacer(),
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
            Spacer()
          ],
        ));
  }
}
