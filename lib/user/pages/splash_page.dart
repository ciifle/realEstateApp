import 'package:flutter/material.dart';
import 'package:realestate/user/pages/home_page.dart';
import 'package:realestate/user/pages/pages.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigate();
  }
  _navigate()async{
    await Future.delayed(Duration(seconds: 4),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Pages()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset("assets/deegamo-04.png"),
        ),
      ),
    );
  }
}
