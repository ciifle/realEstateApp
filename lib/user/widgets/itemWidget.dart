// import 'package:flutter/material.dart';
// import 'package:realestate/admin/services/property-service.dart';
// import 'package:realestate/models/property_model.dart';
// import 'package:realestate/user/pages/detail_page.dart';

// class ItemWidget extends StatefulWidget {
//   ItemWidget({super.key});

//   @override
//   State<ItemWidget> createState() => _ItemWidgetState();
// }

// class _ItemWidgetState extends State<ItemWidget> {
//   final AdminPropertyServices adminPropertyServices = AdminPropertyServices();
//   //get properties from database
//   List<Property> properties = [];

//   void getProperties() async {
//     properties = await adminPropertyServices.getAllProperties(context: context);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: properties.length,
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (Context, index) {
//           var property = properties[index];
//           return Container(
//             color: Colors.cyanAccent,
//           );
//         });
//   }
// }
