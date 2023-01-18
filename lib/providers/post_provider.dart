import 'package:flutter/cupertino.dart';
import 'package:sociolite/services/post_services.dart';

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
}
