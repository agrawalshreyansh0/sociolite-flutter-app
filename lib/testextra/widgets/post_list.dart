// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociolite/utils/themes.dart';

import '../models/post_model.dart';

class PostList extends StatelessWidget {
  PostList({super.key});

  final List<Post> posts = [
    Post(
        userName: "Divyansh Jain",
        title: "All about Success",
        imageUrl:
            "https://i.pinimg.com/236x/5b/f5/0b/5bf50b52133173e4728d58331c2813f4.jpg",
        likeCount: 10,
        userImageUrl:
            "https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        description:
            "whatever the description be with this type of product fadskljalfnsdnsdgwoiejflkasdfads fji"),
    Post(
        userName: "Shreyansh Agrawal",
        title: "not about Success",
        userImageUrl:
            "https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        imageUrl:
            "https://i.pinimg.com/236x/63/37/52/63375268e501063d307706c7e6c4cb18.jpg",
        likeCount: 10,
        description: "whatever the description be with this type of product")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 620,
      child: ListView.builder(
        itemCount: 2,
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
                        posts[index].userImageUrl,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      posts[index].userName,
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
                        posts[index].imageUrl,
                        fit: BoxFit.fill,
                      ),
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    posts[index].description,
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
                    Icon(CupertinoIcons.text_bubble),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Comment"),
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
                    Text("Liked by ${posts[index].likeCount}"),
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
