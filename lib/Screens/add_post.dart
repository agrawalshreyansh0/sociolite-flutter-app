import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociolite/providers/post_provider.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

String? userName;
String? userId;
TextEditingController _contentController = TextEditingController();

class _AddPostState extends State<AddPost> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    final prefs = await SharedPreferences.getInstance();
    userName = await prefs.getString("userName");
    userId = await prefs.getString("userId");
    setState(() {});
  }

  createPost(BuildContext context) {
    log(_contentController.text); 
    Provider.of<PostsProvider>(context,listen: false).addPost(userId.toString(),_contentController.text); 
    Navigator.pushNamed(context, MyRoutes.homeRoute); 
  }

  @override
  Widget build(BuildContext context) {
    return Layout1(
        header: 'Create New Post',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: MyTheme.containerColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userName ?? "Shreyansh Agrawal",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: MyTheme.primary),
                      ),
                      GestureDetector(
                        onTap: () => createPost(context),
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: MyTheme.primary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Post",
                            style: TextStyle(color: MyTheme.text3),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 15,
                    maxLength: 200,
                    controller: _contentController,
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
          ),
        ));
  }
}
