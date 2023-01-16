import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  static const String _baseUrl = "https://sociolite.cyclic.app/auth/";

  static Future<dynamic> createUser(User user) async {
    Uri responseUri = Uri.parse("$_baseUrl/createUser");
    http.Response response = await http.post(responseUri, body: user.toMap());
    Map decoded = jsonDecode(response.body);
    return decoded;
  }
}
