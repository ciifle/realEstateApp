import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:realestate/admin/services/user-service.dart';
import 'package:realestate/models/user_model.dart';
import 'package:realestate/provider/ui_provider.dart';
import 'package:realestate/provider/user_provider.dart';
import 'package:realestate/user/pages/help_center.dart';
import 'package:realestate/user/pages/notification.dart';
import 'package:realestate/user/pages/profile_changes.dart';
import 'package:realestate/user/services/auth_services.dart';
import 'package:realestate/user/widgets/profille_widgets.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/profile";
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  void _pickImage() async {
    try {
      var pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        setState(() {
          _profileImage = File(pickImage.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user = Provider.of<UserProvider>(context).users;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 7.0, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                  ),
                  Positioned(
                      right: 0,
                      left: 75,
                      top: 110,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: _pickImage,
            //   child: _image != null
            //       ? Image.file(
            //           _image!,
            //         )
            //       : Icon(
            //           Icons.person,
            //           size: size.height * 0.05,
            //         ),
            // ),
            Column(
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            // ListTile(
            //   title: Text(
            //     user.name,
            //     style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            //   subtitle: Text(
            //     user.email,
            //     style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.02,
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                size: size.height * 0.05,
                color: Color.fromARGB(255, 49, 14, 121),
              ),
              title: Text(
                "notifications",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                Navigator.pushNamed(context, Notifivation.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.help,
                size: size.height * 0.05,
                color: Color.fromARGB(255, 49, 14, 121),
              ),
              title: Text(
                "About Us",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                Navigator.pushNamed(context, HelpCenter.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: size.height * 0.05,
                color: Color.fromARGB(255, 49, 14, 121),
              ),
              title: Text(
                "logout",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                AuthServices().logOut(context);
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
