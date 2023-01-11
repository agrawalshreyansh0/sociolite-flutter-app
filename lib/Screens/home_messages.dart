// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/themes.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Messages",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                CupertinoIcons.ellipses_bubble,
                size: 30,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              hintText: 'Search "Your Friend"',
              prefixIcon: Icon(
                Icons.search,
                color: MyTheme.icon3,
                size: 25,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey.shade300,
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
