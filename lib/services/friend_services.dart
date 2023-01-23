import 'dart:convert';

import 'package:sociolite/utils/global_variables.dart';
import 'package:http/http.dart' as http;

class FriendService {
  static const _baseUrl = "${Globals.apiUrl}/friend/";

  static Future<void> acceptRequest(String senderId) async {
    Uri requestUri = Uri.parse('$_baseUrl/acceptRequest');
    await http.post(requestUri,
        body: {"senderId": senderId, "recieverId": Globals.userId});
  }
}
