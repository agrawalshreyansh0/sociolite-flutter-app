import 'dart:convert';

import 'package:flutter/cupertino.dart';

class MainUser with ChangeNotifier {
  String id;
  String name;
  String email;
  String? avatar;
  MainUser({
    required this.id,
    required this.name,
    required this.email,
    this.avatar
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'email': email,
    };
  }

  factory MainUser.fromMap(Map<String, dynamic> map) {
    return MainUser(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainUser.fromJson(String source) =>
      MainUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
