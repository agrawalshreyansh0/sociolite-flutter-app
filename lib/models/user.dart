import 'dart:convert';

import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String? id;
  String name;
  String? avatar;
  String? email; 


  User({
    this.id,
    required this.name,
    this.avatar,
    this.email, 
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      email: map['email'] as String, 
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
