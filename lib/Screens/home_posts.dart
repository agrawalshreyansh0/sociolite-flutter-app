import 'package:flutter/material.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/listOrGridBuilders/post_list.dart';
import 'package:sociolite/utils/themes.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
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
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, MyRoutes.addPost),
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.notifications);
                },
                child: const Icon(
                  Icons.notifications_none_rounded,
                  size: 30,
                ),
              )
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 620,
            child: PostList(),
          ),
        ],
      ),
    );
  }
}
