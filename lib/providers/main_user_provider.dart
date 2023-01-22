import 'package:flutter/cupertino.dart';
import 'package:sociolite/models/main_user.dart';
import 'package:sociolite/services/auth_services.dart';
import 'package:sociolite/utils/global_variables.dart';

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
    Globals.userId = _user.id;
  }

  MainUser get user => _user;

  void setUser(MainUser user) {
    _user = user;
    notifyListeners();
  }

  Future<void> updateProfile(String name, String email, String avatar) async {
    _user.name = name;
    _user.email = email;
    _user.avatar = avatar;
    notifyListeners(); 
    await UserService.updateUserProfile(_user.id,name, email, avatar);
  }
}
