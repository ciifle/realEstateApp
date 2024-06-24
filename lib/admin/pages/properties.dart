import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realestate/admin/pages/add_property.dart';
import 'package:realestate/admin/widgets/property_widget.dart';

import 'package:realestate/user/widgets/all_property.dart';
class Properties extends StatefulWidget {
  static const routeName = "/properties";
  const Properties({super.key});

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Property",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AddProperty()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xff003049),
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Color(0xff003049),
                ),
              ),
              child: Center(child: Icon(Icons.add,size: 27,color: Colors.white,)),
            ),
          ),
        ],
      ),
      body: PropertiesWidget(),
    );
  }
}
