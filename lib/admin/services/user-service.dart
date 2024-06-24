import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:realestate/constants/global_variables.dart';
import 'package:realestate/models/user_model.dart';

class AdminUserService {
  //get user
  Future<List<User>> getAllUsers({required BuildContext context}) async {
    List<User> users = [];

    try {
      http.Response res = await http.get(
        Uri.parse("$url/api/user"),
        headers: {
          "Content-Type": "application/json",
        },
      );
      // print(res.body);
      // print(res.statusCode);
      if (res.statusCode == 200) {
        print(res.body);
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          print(jsonDecode(res.body)[i]);
          users.add(User.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      }
    } catch (e) {
      print("get users" + e.toString());
      showAwesome(context, e.toString());
    }
    return users;
  }
}
