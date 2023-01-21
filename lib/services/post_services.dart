import 'dart:convert';
import 'dart:developer';

import "package:http/http.dart" as http;
import 'package:sociolite/utils/global_variables.dart';

import '../models/post.dart';

class PostService {
  static const _baseUrl = "${Globals.apiUrl}/";

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

  static Future<void> addPost(
      String userId, String content, String imageUrl) async {
    Uri responseUri = Uri.parse("$_baseUrl/posts/createPost");
    var response = await http.post(responseUri,
        body: {"user": userId, "content": content, "imageUrl": imageUrl});

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

  static Future<void> toggleLike(
      String userid, String type, String elementId, String postId) async {
    Uri responseUri = Uri.parse("$_baseUrl/likes/toggleLike");
    var response = await http.post(responseUri, body: {
      "user": userid,
      "type": type,
      "id": elementId,
      "postId": postId
    });
    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
  }
}
