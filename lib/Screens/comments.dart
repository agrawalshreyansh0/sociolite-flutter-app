// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociolite/models/comment.dart';
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
  String? userId;
  String? userName;

  final TextEditingController _commentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    final prefs = await SharedPreferences.getInstance();
    userId = await prefs.getString("userId");
    userName = await prefs.getString("userName");
  }

  addComment(String postId) {
    User thisUser = User(name: userName.toString(), id: userId.toString());
    Comment newComment = Comment(
        content: _commentController.text, user: thisUser, postId: postId);
    Provider.of<PostsProvider>(context, listen: false)
        .addcomment(newComment, postId);
  }

  @override
  Widget build(BuildContext context) {
    log("reloaded the list");
    final postId = ModalRoute.of(context)!.settings.arguments;
    final loadedPost = Provider.of<PostsProvider>(context)
        .posts
        .firstWhere((post) => post.id == postId);
    final comments = loadedPost.comments;
    return Layout1(
      header: "Comments",
      child: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 600,
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
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
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
                    onPressed: () => addComment(postId.toString()),
                    icon: Icon(
                      Icons.send_rounded,
                      color: MyTheme.primary,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
