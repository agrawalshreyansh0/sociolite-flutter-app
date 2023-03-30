import 'package:flutter/material.dart';
import 'package:sociolite/services/auth_services.dart';

import '../models/user.dart';

class SearchProvider with ChangeNotifier {
  List<User> users = [];
  int page = 0;
  int limit = 3;
  String key = '';

  SearchProvider() {
    fetchUsers(key);
  }

  fetchUsers(String key) async {
    page++;
    List<User> newUsers = await UserService.getUsersList(limit, page, key);
    users = [...users, ...newUsers];
    notifyListeners();
  }

  List<User> getAllUsers() {
    return [...users];
  }
}
