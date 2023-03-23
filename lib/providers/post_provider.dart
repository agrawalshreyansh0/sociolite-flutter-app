import 'package:flutter/cupertino.dart';
import 'package:sociolite/services/post_services.dart';
import '../models/comment.dart';
import '../models/post.dart';

class PostsProvider with ChangeNotifier {
  List<Post> posts = [];
  List<Post> newPosts = [];
  int page = 0;
  int limit = 3;

  PostsProvider() {
    fetchPosts();
  }

  List<Post> getPostList() {
    return [...posts];
  }

  void fetchPosts() async {
    page++;
    newPosts = await PostService.getAllPosts(limit, page);
    posts = [...posts, ...newPosts];

    notifyListeners();
  }

  void addPost(String userId, String content, String imageUrl) async {
    await PostService.addPost(userId, content, imageUrl);
    fetchPosts();
  }

  void addcomment(Comment currentComment, String postId) async {
    Post currentpost = posts.firstWhere((post) => post.id == postId);
    // currentpost.comments.insert(0, currentComment);
    currentpost.comments.add(currentComment);
    notifyListeners();
    await PostService.addComment(
        currentComment.user.id.toString(), currentComment.content, postId);
  }
}
