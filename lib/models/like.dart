// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sociolite/models/user.dart';

class Like {
  User user; 
  Like({
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
    };
  }

  factory Like.fromMap(Map<String, dynamic> map) {
    return Like(
      user: User.fromMap(map['user'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Like.fromJson(String source) => Like.fromMap(json.decode(source) as Map<String, dynamic>);
}
