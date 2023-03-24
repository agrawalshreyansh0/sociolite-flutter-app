// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DummyUser {
  String id;
  String name;
  String email;
  String? avatar;
  List<String>? friends;
  List<String>? requestsRecieved;

  DummyUser(
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

  factory DummyUser.fromMap(Map<String, dynamic> map) {
    return DummyUser(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] as String,
      friends: map['friends'] != null
          ? List<String>.from(
              (map['friends'] ).map<String?>(
                (x) => x.toString(),
              ),
            )
          : null,
      requestsRecieved: map['requestsRecieved'] != null
          ? List<String>.from(
              (map['requestsRecieved'] ).map<String?>(
                (x) => x.toString(),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DummyUser.fromJson(String source) =>
      DummyUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
