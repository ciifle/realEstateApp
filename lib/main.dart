import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/admin/pages/admin_page.dart';
import 'package:realestate/ai/detail.dart';
import 'package:realestate/ai/drawer.dart';
import 'package:realestate/ai/gridview.dart';
import 'package:realestate/ai/nav_nav.dart';
import 'package:realestate/provider/user_provider.dart';
import 'package:realestate/routes.dart';
import 'package:realestate/user/pages/home_page.dart';
import 'package:realestate/user/pages/login_page.dart';
import 'package:realestate/user/pages/pages.dart';
import 'package:realestate/user/pages/signup_page.dart';
import 'package:realestate/user/pages/splash_page.dart';
import 'package:realestate/user/services/auth_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: LoginPage(),
      home: MyHome(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  AuthServices authServices = AuthServices();
  @override
  void initState() {
    authServices.getUserById(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Splash();
  }
}
