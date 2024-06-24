import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realestate/user/services/auth_services.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 40,
        ),
        children: <Widget>[
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mohamed Ali",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff003049),
                    ),
                  ),
                  Text(
                    "Renter",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff003049),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home_filled,
                        size: 30,
                        color: Color(0xff003049),
                      )),
                ),
                ListTile(
                  title: Text(
                    "user info",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outline,
                        size: 30,
                        color: Color(0xff003049),
                      )),
                ),
                ListTile(
                  title: Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        size: 30,
                        color: Color(0xff003049),
                      )),
                ),
                Spacer(),
                ListTile(
                  onTap: () {
                    AuthServices().logOut(context);
                  },
                  title: Text(
                    "LogOut",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.logout_outlined,
                        size: 30,
                        color: Color(0xff003049),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
