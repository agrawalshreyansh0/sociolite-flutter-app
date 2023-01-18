import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/comment.dart';
import 'package:sociolite/providers/post_provider.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)!.settings.arguments;
    log(postId.toString()); 
    final loadedPost = Provider.of<PostsProvider>(context)
        .posts
        .firstWhere((post) => post.id == postId);
    final comments = loadedPost.comments;
    return Layout1(
      header: loadedPost.user.name,
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final Comment comment = comments[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    comment.user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Icon(CupertinoIcons.heart)
                ]),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Text(comment.content))
              ],
            ),
          );
        },
      ),
    );
  }
}
