// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:sociolite/models/user.dart';
import 'package:sociolite/services/post_services.dart';
import 'package:sociolite/utils/global_variables.dart';
import 'like.dart';

class Comment with ChangeNotifier {
  String? id;
  String content;
  User user;
  String postId;
  bool like;
  int likesCount;
  List<Like> likes; 

  Comment({
    this.id,
    required this.content,
    required this.user,
    required this.postId,
    this.like = false,
    this.likesCount = 0,
    required this.likes,
  }){
    for(int i = 0 ; i< likes.length; i++){
      if(likes[i].user.id == Globals.userId){
        like = true; 
      }
    }
  }

  void toggleLikeStatus() {
    like = !like;
    if (like) {
      likesCount++;
    } else {
      likesCount--;
    }
    notifyListeners();
    PostService.toggleLike(Globals.userId, 'comment', id.toString(), postId);
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
      likes: List<Like>.from(
        (map['likes']).map<Like>(
          (x) => Like.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);
}
