import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:realestate/constants/global_variables.dart';
import 'package:realestate/models/property_model.dart';

import '../../models/user_model.dart';
import '../../provider/user_provider.dart';

class AdminPropertyServices {
  //save property
  void saveProperty({
    required BuildContext context,
    required String name,
    required String desc,
    required String location,
    required File image,
    required double price,
  }) async {
    try {
      String imageUrl = "";

      final cloudinary =
          CloudinaryPublic('dvccwkuxh', 'ml_default', cache: false);

      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );

      imageUrl = response.secureUrl;

      if (imageUrl.isNotEmpty) {
        // var userProvider = Provider.of<UserProvider>(context, listen: false);
        http.Response res = await http.post(
          Uri.parse("$url/api/properties"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "name": name,
            "location": location,
            "image": imageUrl,
            "price": price,
            "desc": desc,
          }),
        );
        // print("body" + res.body);
        // print(res.statusCode);
        if (res.statusCode == 201) {
          showAwesome(context, "Property saved successfully");
          // User user = userProvider.users
          //     .copyWith(ratings: jsonDecode(res.body)['ratings']);
          // userProvider.setUserFromModel(user);
          Navigator.pop(context);
        }
      } else {
        showAwesome(context, "Image not uploaded");
      }
    } catch (e) {
      print("save " + e.toString());
      showAwesome(context, e.toString());
    }
  }

  //update property

  void updateProperty({
    required BuildContext context,
    required String id,
    required String name,
    required String desc,
    required String location,
    required String oldImage,
    File? image,
    required double price,
  }) async {
    try {
      String imageUrl = "";

      if (image != null) {
        final cloudinary =
            CloudinaryPublic('dvccwkuxh', 'ml_default', cache: false);

        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              resourceType: CloudinaryResourceType.Image),
        );

        imageUrl = response.secureUrl;
      }
      http.Response res = await http.put(
        Uri.parse("$url/api/properties/$id"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": name,
          "location": location,
          "image": imageUrl.isEmpty ? oldImage : imageUrl,
          "price": price,
          "desc": desc,
        }),
      );
      // print("body" + res.body);
      // print(res.statusCode);
      if (res.statusCode == 200) {
        showAwesome(context, "Property updates successfully");
        Navigator.pop(context);
      }
    } catch (e) {
      print("update " + e.toString());
      showAwesome(context, e.toString());
    }
  }

  Future meraFuture({
    required BuildContext context,
    required String id,
    required String name,
    required String location,
    required String oldImage,
    File? image,
    required double price,
  }) async {
    try {
      String imageUrl = "";
      if (image != null) {
        showAwesome(context, "Error uploading image");
      }
      http.Response res = await http.get(
        Uri.parse("$url/api/user/$id"),
        headers: {
          "Content-Type": "application/json",
        },
      );
    } catch (e) {
      showAwesome(context, e.toString());
    }
  }
  //delete property

  void deleteProperty({
    required BuildContext context,
    required String id,
  }) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("$url/api/properties/$id"),
        headers: {
          "Content-Type": "application/json",
        },
      );
      // print("body" + res.body);
      // print(res.statusCode);
      if (res.statusCode == 200) {
        showAwesome(context, "Property deleted");
      }
    } catch (e) {
      print("delete " + e.toString());
      showAwesome(context, e.toString());
    }
  }

  //get all properties
  Future<List<Property>> getAllProperties(
      {required BuildContext context}) async {
    List<Property> propertys = [];

    try {
      http.Response res = await http.get(
        Uri.parse("$url/api/properties"),
        headers: {
          "Content-Type": "application/json",
        },
      );
      // print(res.body);
      // print(res.statusCode);
      if (res.statusCode == 200) {
        // print(res.body);
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          // print(jsonDecode(res.body)[i]);
          propertys.add(Property.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      }
    } catch (e) {
      print("get " + e.toString());
      showAwesome(context, e.toString());
    }
    return propertys;
  }
}
