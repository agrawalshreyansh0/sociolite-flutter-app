import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:sociolite/models/comment.dart';

class CommentServce {
  static const String _baseUrl = "https://sociolite.cyclic.app/comments/";

  static Future<List<Comment>> getComments(String postId) async {
    Uri requestUri = Uri.parse("$_baseUrl/getComments/$postId");
    var response = await http.get(requestUri);
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
    List<Comment> comments = [];
    for (var comment in decoded["data"]) {
      Comment com = Comment.fromMap(comment);
      comments.add(com);
    }
    log(comments.toString()); 
    return comments;
  }
}
