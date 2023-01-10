// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociolite/utils/themes.dart';

class CustomButton1 extends StatelessWidget {
  final String text;
  const CustomButton1({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: 280,
        decoration: BoxDecoration(
            color: MyTheme.primary, borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 17,
                  color: MyTheme.text3,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              CupertinoIcons.arrow_right,
              color: MyTheme.icon1,
            )
          ],
        ),
      ),
    );
  }
}


