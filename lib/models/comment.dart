// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sociolite/models/user.dart';

class Comment with ChangeNotifier {
  String? id;
  String content;
  User user;
  String postId;
  bool like;
  int likesCount;

  Comment({
    this.id,
    required this.content,
    required this.user,
    required this.postId,
    this.like = false,
    required this.likesCount,
  });

  void toggleLikeStatus() {
    like = !like;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'user': user.toMap(),
      'post': postId,
      'likesCount': likesCount,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['_id'] != null ? map['_id'] as String : null,
      content: map['content'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      postId: map['post'] as String,
      likesCount: map['likesCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);
}
