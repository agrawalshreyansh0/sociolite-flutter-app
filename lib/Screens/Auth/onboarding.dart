
import 'package:flutter/material.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';
import 'package:sociolite/widgets/custom_button_1.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: MyTheme.containerColor,
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                child: Image.network(
                    "https://i.pinimg.com/564x/43/55/5b/43555b402856950a9454a54d28fc990d.jpg",
                    height: 660),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 520,
                    ),
                    Text(
                      "Welcome To the Sociolite",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyTheme.text3,
                          fontSize: 35),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            child: const CustomButton1(text: "Next"),
            onTap: () =>  Navigator.pushReplacementNamed(context, MyRoutes.logIn) ,
          )
        ]),
      )),
    );
  }

  
}
