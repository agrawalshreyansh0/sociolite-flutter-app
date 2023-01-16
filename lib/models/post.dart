import 'dart:convert';

import 'package:sociolite/models/user.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Post {
  String? id; 
  User user;
  String content;

  Post({
     this.id,
    required this.user,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'user': user.toMap(),
      'content': content,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['_id'] as String,
      user: User.fromMap(map['user'] as Map<String,dynamic>),
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
