import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/constants/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:realestate/provider/user_provider.dart';
import 'package:realestate/user/pages/wishlist.dart';

import '../../models/user_model.dart';

class DetailServices {
  void addToWishlist({
    required BuildContext context,
    required String propertyId,
  }) async {
    try {
      //geting logged user id
      var userid = Provider.of<UserProvider>(context, listen: false).users;
     
      var userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response res = await http.post(Uri.parse("$url/api/addToWishlist"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "userId": userid,
            "propertyId": propertyId,
          }));
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        User user = userProvider.users
            .copyWith(ratings: jsonDecode(res.body)['ratings']);
        userProvider.setUserFromModel(user);
      }
      if (res.statusCode == 400) {
        showAwesome(context, "already in wishlist");
      }
    } catch (e) {
      showAwesome(context, e.toString());
    }
  }

  void removeFromWishlist({
    required BuildContext context,
    required int index,
  }) async {
    try {
      //geting logged user id
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      var userid = Provider.of<UserProvider>(context, listen: false).users.id;

      http.Response res =
          await http.post(Uri.parse("$url/api/addToWishlist/remove/$userid"),
              headers: {
                "Content-Type": "application/json",
              },
              body: jsonEncode({
                "index": index,
              }));
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        User user = userProvider.users
            .copyWith(ratings: jsonDecode(res.body)['ratings']);
        userProvider.setUserFromModel(user);
      }
      if (res.statusCode == 400) {
        showAwesome(context, "already in wishlist");
      }
    } catch (e) {
      showAwesome(context, e.toString());
    }
  }
}
