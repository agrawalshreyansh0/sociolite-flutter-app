import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/providers/post_provider.dart';

import '../models/post.dart';
import '../widgets/post_layout.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    PostsProvider postsProvider = Provider.of<PostsProvider>(context);
    List<Post> posts = postsProvider.getPostList();
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        Post post = posts[index];
        return ChangeNotifierProvider.value(
          value: post,
          child: const PostLayout(),
        );
      },
    );
  }
}
