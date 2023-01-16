// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sociolite/models/post.dart';
import 'package:sociolite/models/user.dart';

class Comment {
  String? id;
  String content;
  User user;
  Post post;
  Comment({
    this.id,
    required this.content,
    required this.user,
    required this.post,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'content': content,
      'user': user.toMap(),
      'post': post.toMap(),
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['_id'] as String,
      content: map['content'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      post: Post.fromMap(map['post'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);
}
