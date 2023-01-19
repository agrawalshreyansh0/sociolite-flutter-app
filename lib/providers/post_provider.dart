import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:sociolite/services/post_services.dart';

import '../models/comment.dart';
import '../models/post.dart';

class PostsProvider with ChangeNotifier {
  List<Post> posts = [];

  PostsProvider() {
    fetchPosts();
  }

  List<Post> getPostList() {
    return [...posts];
  }

  void fetchPosts() async {
    posts = await PostService.getAllPosts();
    notifyListeners();
  }

  void addPost(String userId, String content) async {
    await PostService.addPost(userId, content);
    fetchPosts();
  }

  void addcomment(Comment currentComment, String postId) async {
    Post currentpost = posts.firstWhere((post) => post.id == postId);
    currentpost.comments.add(currentComment);
    notifyListeners();
    await PostService.addComment(
        currentComment.user.id.toString(), currentComment.content, postId);
  }
}
