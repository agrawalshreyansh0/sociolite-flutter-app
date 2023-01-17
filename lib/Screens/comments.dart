import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/providers/comment_provider.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

import '../models/comment.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    final String postId = ModalRoute.of(context)!.settings.arguments as String;
    CommentProvider.postId = postId; 
    CommentProvider commentProvider = Provider.of<CommentProvider>(context);
    // commentProvider.fetchComments(postId);
    List<Comment> comments = commentProvider.getComments();
    return Layout1(
      header: "Comments",
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                    ),
                  ),
                  Text(comments[index].user.name),
                  Spacer(),
                  Icon(CupertinoIcons.heart)
                ],
              ),
              Text(comments[index].content),
            ]),
          );
        },
      ),
    );
  }
}
