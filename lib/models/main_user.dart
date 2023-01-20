import 'dart:convert';

class MainUser {
  String id;
  String name;
  String email;
  MainUser({
    required this.id,
    required this.name,
    required this.email,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory MainUser.fromJson(String source) =>
      MainUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
