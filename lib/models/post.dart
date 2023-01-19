import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sociolite/models/comment.dart';
import 'package:sociolite/models/user.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Post with ChangeNotifier {
  String? id;
  User user;
  String content;
  List<Comment> comments;
  bool like;
  int commentsCount; 
  int likesCount; 

  Post({
    this.id,
    required this.user,
    required this.content,
    required this.comments,
    this.like = false,
    required this.commentsCount, 
    required this.likesCount,
  });

  void toggleLikeStatus() {
    like = !like;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'user': user.toMap(),
      'content': content,
      'comments': comments.map((x) => x.toMap()).toList(),
      'commentsCount': commentsCount,
      'likesCount': likesCount,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['_id'] != null ? map['_id'] as String : null,
      user: User.fromMap(map['user'] as Map<String,dynamic>),
      content: map['content'] as String,
      comments: List<Comment>.from((map['comments']).map<Comment>((x) => Comment.fromMap(x as Map<String,dynamic>),),),
      commentsCount: map['commentsCount'] as int,
      likesCount: map['likesCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
