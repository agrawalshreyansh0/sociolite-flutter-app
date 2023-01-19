import 'dart:convert';
import 'dart:developer';

import "package:http/http.dart" as http;

import '../models/post.dart';

class PostService {
  static const _baseUrl = "https://sociolite.cyclic.app/";

  static Future<List<Post>> getAllPosts() async {
    Uri responseUri = Uri.parse("$_baseUrl/posts/allPosts");
    var response = await http.get(responseUri);
    Map decoded = jsonDecode(response.body);
    var decodedposts = decoded["posts"];
    log(decoded.toString());
    List<Post> posts = [];
    for (var postMap in decodedposts) {
      Post newPost = Post.fromMap(postMap);
      posts.add(newPost);
    }
    return posts;
  }

  static Future<void> addPost(String userId, String content) async {
    Uri responseUri = Uri.parse("$_baseUrl/posts/createPost");
    var response = await http
        .post(responseUri, body: {"user": userId, "content": content});

    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> addComment(
      String userId, String content, String postId) async {
    Uri responseUri = Uri.parse("$_baseUrl/comments/createComment");
    var response = await http.post(responseUri,
        body: {"user": userId, "content": content, "post": postId});
    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
  }
}
