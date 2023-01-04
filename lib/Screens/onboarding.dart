// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sociolite/utils/themes.dart';
import 'package:sociolite/widgets/custom_button_1.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 3),
      color: MyTheme.containerColor,
      child: Column(children: [
        ClipRRect(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
          child: Image.network(
            "https://i.pinimg.com/originals/c5/d6/c0/c5d6c0eae34ae8bb69533bc7872308ad.jpg",
            height: 660
          ),
        ),
        SizedBox(
          height: 15,
        ),
        CustomButton1(text: "Next")
      ]),
    ));
  }
}
