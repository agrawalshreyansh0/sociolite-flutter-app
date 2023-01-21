import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/comment.dart';
import 'package:sociolite/utils/themes.dart';

class CommentLayout extends StatelessWidget {
  const CommentLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final comment = Provider.of<Comment>(context);
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           CircleAvatar(
            backgroundImage: NetworkImage(
              comment.user.avatar.toString(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Consumer<Comment>(
            builder: (context, value, child) => SizedBox(
              width: 200,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '${comment.user.name} ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: comment.content),
                TextSpan(
                  text: "\n${comment.likesCount} likes",
                  style: TextStyle(
                    color: MyTheme.text2,
                    fontSize: 12,
                  ),
                )
              ], style: TextStyle(color: MyTheme.text1, fontSize: 13))),
            ),
          ),
          const Spacer(),
          Consumer<Comment>(
            builder: (context, comment, child) => IconButton(
              onPressed: () => comment.toggleLikeStatus(),
              icon: comment.like
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_outline,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
