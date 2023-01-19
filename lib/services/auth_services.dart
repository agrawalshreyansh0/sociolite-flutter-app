import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class UserService {
  static const String _baseUrl = "https://sociolite.cyclic.app/auth/";

  static Future<dynamic> createUser(
      String email, String password, String name) async {
    Uri responseUri = Uri.parse("$_baseUrl/createUser");
    http.Response response = await http.post(responseUri,
        body: {"email": email, "password": password, "name": name});
    Map decoded = jsonDecode(response.body);
    return decoded;
  }

  static Future<dynamic> signIn(String email, String password) async {
    Uri responseUri = Uri.parse("$_baseUrl/signIn");
    http.Response response = await http
        .post(responseUri, body: {"email": email, "password": password});
    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
    return decoded;
  }

}
