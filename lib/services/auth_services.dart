// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociolite/models/main_user.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/utils/global_variables.dart';
import 'package:sociolite/utils/routes.dart';

class UserService {
  static const String _baseUrl = "${Globals.apiUrl}/auth/";

  static Future<void> createUser(
      BuildContext context, String email, String password, String name) async {
    Uri responseUri = Uri.parse("$_baseUrl/createUser");
    http.Response response = await http.post(responseUri,
        body: {"email": email, "password": password, "name": name});
    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
    String message = decoded["message"].toString();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
    if (decoded["success"]) {
      Navigator.pop(context);
    }
  }

  static Future<void> signIn(
      BuildContext context, String email, String password) async {
    Uri responseUri = Uri.parse("$_baseUrl/signIn");
    http.Response response = await http
        .post(responseUri, body: {"email": email, "password": password});
    Map decoded = jsonDecode(response.body);
    log(decoded.toString());
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(decoded["message"])));
    if (decoded["success"]) {
      Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
      String token = decoded["data"]["token"];
      MainUser currentUser =
          MainUser.fromMap(decoded["data"]["userdata"] as Map<String, dynamic>);
      Provider.of<UserProvider>(context, listen: false).setUser(currentUser);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', token);
    }
  }

  static Future<MainUser> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");
    if (token == null) {
      await prefs.setString("authToken", "");
    }
    Uri responseUri = Uri.parse("$_baseUrl/getUserData");
    http.Response response =
        await http.get(responseUri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authToken': token.toString(),
    });
    var decoded = jsonDecode(response.body);

    log(decoded.toString());

    if (!decoded["success"]) {
      //logout wala scene ::
    }

    MainUser user = MainUser.fromMap(decoded["data"]);
    return user;
  }

  static Future<bool> verifyToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");
    if (token == null) {
      await prefs.setString("authToken", "");
    }
    Uri requestUri = Uri.parse("$_baseUrl/validateToken");
    http.Response response =
        await http.get(requestUri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authToken': token.toString(),
    });
    var decoded = jsonDecode(response.body);
    return decoded["success"];
  }

  static updateUserProfile(
      String userId, String name, String email, String avatar) async {
    Uri requestUri = Uri.parse("$_baseUrl/updateUser");
    http.Response resonse = await http.post(requestUri,
        body: {"id": userId, "name": name, "email": email, "avatar": avatar});
    Map decoded = jsonDecode(resonse.body);
    log(decoded.toString()); 
  }
}
