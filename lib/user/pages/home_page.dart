import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:realestate/admin/services/property-service.dart';
import 'package:realestate/ai/gridview.dart';
import 'package:badges/badges.dart' as badges;
import 'package:realestate/models/property_model.dart';
import 'package:realestate/user/pages/ProfilePage.dart';
import 'package:realestate/user/widgets/categoryWidget.dart';
import 'package:realestate/user/widgets/drawerWidget.dart';
import 'package:realestate/user/widgets/itemWidget.dart';
import 'package:realestate/user/widgets/property.dart';

import 'All-properties_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AdminPropertyServices adminPropertyServices = AdminPropertyServices();
  //get properties from database
  List<Property> properties = [];

  void getProperties() async {

    properties = await adminPropertyServices.getAllProperties(context: context);
    if(mounted){
          setState(() {});
    }

  }

  @override
  void initState() {
    getProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: null,
        title: Image.asset(
          "assets/deegamo-02.png",
          // width: size.width * 1,
          // height: size.height * 1,
        ),
      ),
      key: _scaffoldKey,
      // drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          children: [
            //custom app bar
            // Container(
            //   color: Colors.white,
            //   child: Padding(
            //     padding: EdgeInsets.all(10),
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.only(left: 20),
            //           child: Image.asset(
            //             "assets/deegamo-02.png",
            //             width: size.width * .6,
            //             height: size.height * .6,
            //           ),
            //         ),
            //         // Spacer(),
            //         // badges.Badge(
            //         //   badgeStyle: badges.BadgeStyle(
            //         //     padding: EdgeInsets.all(7),
            //         //     badgeColor:Color(0xff640d14),
            //         //   ),
            //         //   badgeContent: Text(
            //         //     "3",style: TextStyle(
            //         //       color: Colors.white
            //         //   ),
            //         //   ),
            //         //   child: InkWell(
            //         //     onTap: (){},
            //         //     child: Icon(
            //         //       Icons.notifications,
            //         //       size: 33,
            //         //       color: Color(0xff003049),
            //         //     ),
            //         //   ),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            // // HomeAppBar(),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Image.asset(
            //     "assets/deegamo-02.png",
            //     width: size.width * .6,
            //     height: size.height * .6,
            //   ),
            // ),
            // Spacer(),
            //search
            Container(
              // height: 500,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          color: Color(0xff003049).withOpacity(.25),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here....",
                        ),
                      ),
                    ),
                  ),
                  //categories
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   padding: EdgeInsets.all(10),
                  //   child: Text("Categories",style: TextStyle(
                  //     fontSize: 27,
                  //     fontWeight: FontWeight.bold,
                  //     color: Color(0xff003049),
                  //   ),),
                  // ),
                  // CategoriesWidget(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      "Best Property",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff003049),
                      ),
                    ),
                  ),
                  PropertyWidget(),
                  //all property
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        child: Text(
                          "Properties",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff003049),
                          ),
                        ),
                      ),
                    ],
                  ),
                  PropertyWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
