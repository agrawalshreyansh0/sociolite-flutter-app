
import 'package:flutter/material.dart';
import 'package:sociolite/utils/routes.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(),
               
                GestureDetector(onTap:(() =>  Navigator.pushNamed(context, MyRoutes.settings))  ,
                  child: const Icon(
                  Icons.settings  ,
                    size: 30,
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}