// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sociolite/models/user.dart';

class MainUser with ChangeNotifier {
  String id;
  String name;
  String email;
  String? avatar;
  List<User>? friends;
  List<User>? requestsRecieved;

  MainUser(
      {required this.id,
      required this.name,
      required this.email,
      this.avatar,
      this.friends,
      this.requestsRecieved});

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
      friends: map['friends'] != null
          ? List<User>.from(
              (map['friends'] ).map<User?>(
                (x) => User.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      requestsRecieved: map['requestsRecieved'] != null
          ? List<User>.from(
              (map['requestsRecieved'] ).map<User?>(
                (x) => User.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainUser.fromJson(String source) =>
      MainUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
