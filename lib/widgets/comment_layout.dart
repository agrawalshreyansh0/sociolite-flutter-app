import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/comment.dart';
import 'package:sociolite/utils/themes.dart';

class CommentLayout extends StatelessWidget {
  const CommentLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final comment = Provider.of<Comment>(context, listen: false);
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start, children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 200,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '${comment.user.name} ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: comment.content),
          ], style: TextStyle(color: MyTheme.text1, fontSize: 13))),
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
                ))
      ]),
    );
  }
}
