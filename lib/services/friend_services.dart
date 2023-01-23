import 'dart:convert';
import 'dart:developer';

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

  static Future<void> deleteRequest(String senderId) async {
    Uri responseUri = Uri.parse('$_baseUrl/deleteRequest');
    http.Response response = await http.post(responseUri,
        body: {"senderId": senderId, "recieverId": Globals.userId});
    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
  }
}
