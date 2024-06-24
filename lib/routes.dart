import 'package:flutter/material.dart';
import 'package:realestate/admin/orders/order_list.dart';
import 'package:realestate/admin/pages/add_property.dart';
import 'package:realestate/admin/pages/admin_page.dart';
import 'package:realestate/admin/pages/properties.dart';
import 'package:realestate/admin/pages/users_page.dart';
import 'package:realestate/user/pages/ProfilePage.dart';
import 'package:realestate/user/pages/help_center.dart';
import 'package:realestate/user/pages/home_page.dart';
import 'package:realestate/user/pages/login_page.dart';
import 'package:realestate/user/pages/notification.dart';
import 'package:realestate/user/pages/pages.dart';
import 'package:realestate/user/pages/profile_changes.dart';
import 'package:realestate/user/pages/signup_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(builder: (_) => HomePage());
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (_) => LoginPage());

    case SignUpPage.routeName:
      return MaterialPageRoute(builder: (_) => SignUpPage());
    case ProfilePage.routeName:
      return MaterialPageRoute(builder: (_) => ProfilePage());
    case AdminPage.routeName:
      return MaterialPageRoute(builder: (_) => AdminPage());
    case Properties.routeName:
      return MaterialPageRoute(builder: (_) => Properties());
    case AddProperty.routeName:
      return MaterialPageRoute(builder: (_) => AddProperty());
    case ProfileChange.routeName:
      return MaterialPageRoute(builder: (_) => ProfileChange());
    case Notifivation.routeName:
      return MaterialPageRoute(builder: (_)=>Notifivation());
    case HelpCenter.routeName:
      return MaterialPageRoute(builder: (_)=>HelpCenter());
    case Pages.routeName:
      return MaterialPageRoute(builder: (_)=>Pages());
    case  OrderList.routeName:
      return MaterialPageRoute(builder: (_)=>OrderList());
    case UsersPageAdmin.routeName:
        return MaterialPageRoute(builder: (_)=>UsersPageAdmin());

    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
