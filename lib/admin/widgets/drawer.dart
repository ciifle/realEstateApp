import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:realestate/admin/orders/order_list.dart';
import 'package:realestate/admin/pages/admin_page.dart';
import 'package:realestate/admin/pages/properties.dart';
import 'package:realestate/admin/pages/users_page.dart';
import 'package:realestate/provider/user_provider.dart';
import 'package:realestate/user/services/auth_services.dart';

class AdminDrawer extends StatelessWidget {
  AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).users;
    return Drawer(
      backgroundColor: Color(0xff003049).withOpacity(.8),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 50,
        ),
        children: <Widget>[
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    user.isAdmin ? "Admin" : "User",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AdminPage.routeName);
                  },
                  title: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home_filled,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Properties.routeName);
                  },
                  title: Text(
                    "For rent",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.done,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, OrderList.routeName);
                  },
                  title: Text(
                    "Order list",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.done,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, UsersPageAdmin.routeName);
                  },
                  title: Text(
                    "Users",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.people,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                ListTile(
                  onTap: () {
                    AuthServices().logOut(context);
                  },
                  title: Text(
                    "LogOut",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.logout_outlined,
                        size: 30,
                        color: Colors.white,
                      )),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
