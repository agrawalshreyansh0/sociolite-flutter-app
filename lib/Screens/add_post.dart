import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociolite/utils/themes.dart';

import 'package:sociolite/widgets/custom_layout_1.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _content = new TextEditingController();

    return Layout1(
        header: 'Create New Post',
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 20,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: MyTheme.containerColor,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
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
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Post",
                        style: TextStyle(color: MyTheme.text3),
                      ),
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          color: MyTheme.primary,
                          borderRadius: BorderRadius.circular(5)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 7,controller: _content,
                  decoration: InputDecoration(
                    hintText: "What's on your mind?",
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 0, color: Colors.grey.shade100),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 0, color: Colors.grey.shade100),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 0, color: Colors.grey.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 0, color: Colors.grey.shade100),
                    ),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: MyTheme.primary),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
