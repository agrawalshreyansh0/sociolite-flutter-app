// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/widgets/post_list.dart';
import 'package:sociolite/utils/themes.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Sociolite",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.primary),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, MyRoutes.addPost),
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.notifications),
                child: Icon(
                  Icons.notifications_none_rounded,
                  size: 30,
                ),
              )
            ],
          ),
          PostList()
        ],
      ),
    );
  }
}
