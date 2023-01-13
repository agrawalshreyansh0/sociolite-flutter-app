// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(),
               
                Icon(
                Icons.settings  ,
                  size: 30,
                )
              ],
            )
        ],
      ),
    );
  }
}