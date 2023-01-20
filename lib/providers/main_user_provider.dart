import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:sociolite/models/main_user.dart';
import 'package:sociolite/services/auth_services.dart';

class UserProvider with ChangeNotifier {
  MainUser _user = MainUser(
    id: "",
    name: '',
    email: '',
  );

  UserProvider() {
    fetchUser();
  }

  fetchUser() async {
    _user = await UserService.getUserData();
    notifyListeners(); 
  }

  MainUser get user => _user;

  void setUser(MainUser user) {
    log("Calling set user");
    _user = user;
    notifyListeners();
  }
}
