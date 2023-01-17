import 'package:flutter/cupertino.dart';
import 'package:sociolite/services/comment_services.dart';

import '../models/comment.dart';

class CommentProvider with ChangeNotifier {
  static String postId = ""; 
  List<Comment> comments = [];

  CommentProvider() {
    fetchComments();
  }

  List<Comment> getComments() {
    return comments;
  }

  void fetchComments() async {
    comments = await CommentServce.getComments(postId);
    notifyListeners();
  }
}
