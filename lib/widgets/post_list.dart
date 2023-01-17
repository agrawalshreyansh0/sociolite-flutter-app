// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/providers/post_provider.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';

import '../models/post.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    PostsProvider postsProvider = Provider.of<PostsProvider>(context);
    List<Post> posts = postsProvider.getPostList();
    return Container(
      width: double.infinity,
      height: 620,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyTheme.containerColor,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      posts[index].user.name.toString(),
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    width: double.infinity,
                    height: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://i.pinimg.com/236x/5b/f5/0b/5bf50b52133173e4728d58331c2813f4.jpg",
                        fit: BoxFit.fill,
                      ),
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    posts[index].content,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      CupertinoIcons.heart,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Like"),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, MyRoutes.comments),
                      child: Row(children: [
                        Icon(CupertinoIcons.text_bubble),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Comment"),
                      ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text("Liked by 10"),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
