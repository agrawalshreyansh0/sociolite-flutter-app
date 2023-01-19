
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/comment.dart';
import 'package:sociolite/providers/post_provider.dart';
import 'package:sociolite/widgets/comment_layout.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)!.settings.arguments;
    final loadedPost = Provider.of<PostsProvider>(context,listen: false)
        .posts
        .firstWhere((post) => post.id == postId);
    final comments = loadedPost.comments;
    return Layout1(
      header: "Comments",
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final Comment comment = comments[index];
                return ChangeNotifierProvider.value(
                  value: comment,
                  child: const CommentLayout(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
