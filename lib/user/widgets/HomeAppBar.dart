import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              Icons.sort,
              color: Color(0xff003049),
              size: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Deegaamo Estate",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff003049),
                ),
              ),
            ),
            // Spacer(),
            // badges.Badge(
            //   badgeStyle: badges.BadgeStyle(
            //     padding: EdgeInsets.all(7),
            //     badgeColor:Color(0xff640d14),
            //   ),
            //   badgeContent: Text(
            //     "3",style: TextStyle(
            //       color: Colors.white
            //   ),
            //   ),
            //   child: InkWell(
            //     onTap: (){},
            //     child: Icon(
            //       Icons.notifications,
            //       size: 33,
            //       color: Color(0xff003049),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
