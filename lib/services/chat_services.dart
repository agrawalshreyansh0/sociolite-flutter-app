// ignore_for_file: unused_import

import 'package:sociolite/models/message.dart';
import 'package:sociolite/utils/global_variables.dart';

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociolite/models/main_user.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/utils/routes.dart';
import '../models/user.dart';

class ChatService {
  static const _baseUrl = "${Globals.apiUrl}/chatRoom/";

  static Future<String> getChatRoom(String user1, String user2) async {
    Uri requestUri = Uri.parse('$_baseUrl/getChatRoom');
    http.Response response =
        await http.post(requestUri, body: {'user1': user1, 'user2': user2});
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
    return decoded['data']['_id'];
  }

  static Future<void> sendMessage(
      String senderId, String recieverId, String room, String text) async {
    Uri requestUri = Uri.parse('$_baseUrl/sendMessage');
    http.Response response = await http.post(requestUri, body: {
      "sender": senderId,
      "reciever": recieverId,
      "room": room,
      "text": text
    });
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<List<Message>> getChats(
      String room, int limit, int page) async {
    Uri requestUri =
        Uri.parse('$_baseUrl/getChats?room=$room&limit=$limit&page=$page');
    http.Response response = await http.get(requestUri);
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
    List<Message> messages = [];
    for (var message in decoded['data']) {
      Message newMessage = Message.fromMap(message);
      messages.add(newMessage);
    }
    return messages;
  }
}
