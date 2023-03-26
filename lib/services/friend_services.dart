import 'dart:convert';
import 'dart:developer';

import 'package:sociolite/models/dummy_user.dart';
import 'package:sociolite/utils/global_variables.dart';
import 'package:http/http.dart' as http;

class FriendService {
  static const _baseUrl = "${Globals.apiUrl}/friend/";

  static Future<void> acceptRequest(String senderId) async {
    Uri requestUri = Uri.parse('$_baseUrl/acceptRequest');

    http.Response response = await http.post(requestUri,
        body: {"senderId": senderId, "recieverId": Globals.userId});

    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> deleteRequest(String recieverId) async {
    Uri responseUri = Uri.parse('$_baseUrl/deleteRequest');
    http.Response response = await http.post(responseUri,
        body: {"senderId": Globals.userId, "recieverId": recieverId});
    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<DummyUser> getUserFromId(String userId) async {
    Uri requestUri = Uri.parse("$_baseUrl/getProfile");
    http.Response response = await http.post(requestUri, body: {"id": userId});
    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
    DummyUser user = DummyUser.fromMap(decoded['data']);
    return user;
  }

  static Future<void> sendRequest(String id) async {
    String senderId = Globals.userId;
    Uri requestUri = Uri.parse("$_baseUrl/sendRequest");
    http.Response response = await http
        .post(requestUri, body: {'senderId': senderId, 'recieverId': id});
    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> unfriend(String id) async {
    String senderId = Globals.userId;
    Uri responseUri = Uri.parse('$_baseUrl/unfriend');
    http.Response response = await http
        .post(responseUri, body: {'senderId': senderId, 'recieverId': id});
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }
}
