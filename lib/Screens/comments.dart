import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/comment.dart';
import 'package:sociolite/models/main_user.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/providers/post_provider.dart';
import 'package:sociolite/utils/themes.dart';
import 'package:sociolite/widgets/comment_layout.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';
import '../models/user.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {

  final TextEditingController _commentController = TextEditingController();

  addComment(String postId, String userId, String userName) {
    User thisUser = User(name: userName, id: userId);
    Comment newComment = Comment(
        content: _commentController.text, user: thisUser, postId: postId);
    Provider.of<PostsProvider>(context, listen: false)
        .addcomment(newComment, postId);
        _commentController.text = ""; 
  }

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)!.settings.arguments;
    final loadedPost = Provider.of<PostsProvider>(context)
        .posts
        .firstWhere((post) => post.id == postId);
    final comments = loadedPost.comments;
    return Layout1(
      header: "Comments",
      child: SingleChildScrollView(
        child: SizedBox(
          height: 680,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 570,
                child: ListView.builder(
                  reverse: true,
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final Comment comment = comments[comments.length-1-index];
                    return ChangeNotifierProvider.value(
                      value: comment,
                      child: const CommentLayout(),
                    );
                  },
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 240,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      style: const TextStyle(height: 1),
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: "Add a comment...",
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
                            fontWeight: FontWeight.bold,
                            color: MyTheme.primary),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      MainUser user =
                          Provider.of<UserProvider>(context, listen: false)
                              .user;
                      addComment(postId.toString(), user.id, user.name);
                    },
                    icon: Icon(
                      Icons.send_rounded,
                      color: MyTheme.primary,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}