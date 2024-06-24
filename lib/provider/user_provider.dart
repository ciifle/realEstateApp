import 'package:flutter/material.dart';
import 'package:realestate/models/user_model.dart';

class UserProvider extends ChangeNotifier {
 
  User users = User(
    id: "",
    name: "",
    email: "",
    password: "",
    isAdmin: false,
    ratings: [],
    profile: '',
    // rating: [],
  );
  User get _user => users;

  void setUser(String user) {
    users = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    users = user;
    notifyListeners();
  }
}
