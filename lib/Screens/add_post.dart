import 'package:flutter/material.dart';
import 'package:sociolite/utils/themes.dart';

import 'package:sociolite/widgets/custom_layout_1.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout1(
        header: 'Create New Post',
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: MyTheme.containerColor,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shreyansh Agrawal",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: MyTheme.primary),
                    ),
                    ElevatedButton(onPressed: null, child: Text("Done"))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
