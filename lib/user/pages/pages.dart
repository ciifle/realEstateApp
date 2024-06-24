import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:realestate/user/pages/All-properties_page.dart';
import 'package:realestate/user/pages/ProfilePage.dart';
import 'package:realestate/user/pages/home_page.dart';
import 'package:realestate/user/pages/wishlist.dart';

class Pages extends StatefulWidget {
  static const routeName = "/pages";
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _selectedPage = 0;
  List<Widget> pagesList = [
    HomePage(),
    Wishlist(),
    AllPropertyPage(),
    ProfilePage(),
  ];
  void update(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesList[_selectedPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            gap: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(10),
            onTabChange: update,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite_border,
                text: "wishlist",
              ),
              GButton(
                icon: Icons.villa,
                text: "All",
              ),
              GButton(
                icon: Icons.person,
                text: "profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
