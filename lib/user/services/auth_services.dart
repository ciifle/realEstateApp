import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:realestate/admin/pages/admin_page.dart';
import 'package:realestate/constants/global_variables.dart';
import 'package:realestate/models/user_model.dart';
import 'package:realestate/provider/user_provider.dart';
import 'package:realestate/user/pages/home_page.dart';
import 'package:realestate/user/pages/login_page.dart';
import 'package:realestate/user/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  //register
  void RegisterUser({
    required BuildContext context,
    required String name,
    // required String image,
    required String email,
    required String password,
  }) async {
    try {
      // String imageUrl = "";

      // final cloudinary =
      //     CloudinaryPublic('dvccwkuxh', 'ml_default', cache: false);

      // CloudinaryResponse response = await cloudinary.uploadFile(
      //   CloudinaryFile.fromFile(image.path,
      //       resourceType: CloudinaryResourceType.Image),
      // );

      // imageUrl = response.secureUrl;

      http.Response res = await http.post(Uri.parse("$url/api/user"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "username": name,
            "email": email,
            "password": password,
          }));
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 201) {
        showAwesome(context, "User registered successfully");
        Navigator.pushNamed(context, LoginPage.routeName);
      }
    } catch (e) {
      showAwesome(context, e.toString());
    }
  }

  //login
  void LoginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse("$url/api/user/login"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
            "password": password,
          }));
      print(res.statusCode);
      print(res.body);

      SharedPreferences preferences = await SharedPreferences.getInstance();

      preferences.setString("userId", jsonDecode(res.body)['_id']);
      if (context.mounted) {
        Provider.of<UserProvider>(context, listen: false).setUser(res.body);
      }
      if (res.statusCode == 200) {
        if (context.mounted) {
          showAwesome(context, "Welcome to deegaamo");
          bool isAdmin = jsonDecode(res.body)['isAdmin'];
          isAdmin
              ? Navigator.pushNamed(context, AdminPage.routeName)
              : Navigator.pushNamed(context, Pages.routeName);
        }
      }
    } catch (e) {
      print(e.toString());
      showAwesome(context, e.toString());
    }
  }

  //logout
  void logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("userId");
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, (route) => false);
    }
  }

  //get all user
  Future<List<User>> getAllUsers({required BuildContext context}) async {
    List<User> users = [];

    try {
      http.Response res = await http.get(
        Uri.parse("$url/api/user"),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 200) {
        print(res.body);
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          print(jsonDecode(res.body)[i]);
          users.add(User.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      }
    } catch (e) {
      print("get " + e.toString());
      showAwesome(context, e.toString());
    }
    return users;
  }

  //get user by id
  void getUserById(BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      String id = preferences.getString("userId") ?? "";

      if (id != "") {
        http.Response res = await http.get(
          Uri.parse("$url/api/user/$id"),
          headers: {
            "Content-Type": "application/json",
          },
        );

        // print("res.body");
        // print(res.body);

        Provider.of<UserProvider>(context, listen: false).setUser(res.body);
        var user = Provider.of<UserProvider>(context).users;
        if (user.isAdmin) {
          Navigator.pushNamedAndRemoveUntil(
              context, AdminPage.routeName, (fasle) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, Pages.routeName, (fasle) => false);
        }
      } else {
        Navigator.pushNamed(context, LoginPage.routeName);
      }
    } catch (e) {
      if (context.mounted) {
        showAwesome(context, e.toString());
      }
    }
  }
}
