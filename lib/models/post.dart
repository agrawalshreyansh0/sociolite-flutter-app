import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:sociolite/models/comment.dart';
import 'package:sociolite/models/like.dart';
import 'package:sociolite/models/user.dart';
import 'package:sociolite/services/post_services.dart';

import '../utils/global_variables.dart';

class Post with ChangeNotifier {
  String? id;
  User user;
  String content;
  List<Comment> comments;
  bool like;
  List<Like> likes;
  int commentsCount;
  int likesCount;
  String? imageUrl;

  Post({
    this.id,
    required this.user,
    required this.content,
    required this.comments,
    this.like = false,
    required this.commentsCount,
    required this.likesCount,
    this.imageUrl,
    required this.likes,
  }) {
    for (int i = 0; i < likes.length; i++) {
      if (likes[i].user.id == Globals.userId) {
        like = true; 
      }
    }
  }

  void toggleLikeStatus() {
    like = !like;
    if (!like) {
      likesCount--;
    } else {
      likesCount++;
    }
    notifyListeners();
    PostService.toggleLike(
        Globals.userId, 'post', id.toString(), id.toString());
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'user': user.toMap(),
      'content': content,
      'comments': comments.map((x) => x.toMap()).toList(),
      'commentsCount': commentsCount,
      'likesCount': likesCount,
      'imageUrl': imageUrl,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    Post newpost = Post(
      id: map['_id'] != null ? map['_id'] as String : null,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      content: map['content'] as String,
      comments: List<Comment>.from(
        (map['comments']).map<Comment>(
          (x) => Comment.fromMap(x as Map<String, dynamic>),
        ),
      ),
      commentsCount: map['commentsCount'] as int,
      likesCount: map['likesCount'] as int,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      likes: List<Like>.from(
        (map['likes']).map<Like>(
          (x) => Like.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );

    return newpost;
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) {
    return Post.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}
