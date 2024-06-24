import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realestate/admin/pages/updateProperty.dart';
import 'package:realestate/admin/services/property-service.dart';
import 'package:realestate/models/property_model.dart';
import 'package:realestate/user/pages/detail_page.dart';

class PropertiesWidgetUser extends StatefulWidget {
  PropertiesWidgetUser({super.key});

  @override
  State<PropertiesWidgetUser> createState() => _PropertiesWidgetUserState();
}

class _PropertiesWidgetUserState extends State<PropertiesWidgetUser> {
  final AdminPropertyServices adminPropertyServices = AdminPropertyServices();
  //get properties from database
  List<Property> properties = [];

  void getProperties() async {
    properties = await adminPropertyServices.getAllProperties(context: context);
    setState(() {});
  }

  void delete(String id) async {
    adminPropertyServices.deleteProperty(context: context, id: id);
    setState(() {});
  }

  @override
  void initState() {
    getProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: properties.isEmpty
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: () async {
          getProperties();
        },
        child: ListView.builder(
            itemCount: properties.length,
            itemBuilder: (context, index) {
              var property = properties[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(property: property)));
                },
                child: Container(
                  margin:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  height: size.height * 0.17,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-10, -10),
                          color: Colors.grey.withOpacity(.1),
                          spreadRadius: 1,
                          blurRadius: 10),
                      BoxShadow(
                          offset: Offset(10, 10),
                          color: Colors.grey.withOpacity(.1),
                          spreadRadius: 1,
                          blurRadius: 10),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: size.width * 0.3,
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              property.image,
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        width: 3,
                        height: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            property.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            property.price.toString() + "\$",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            property.location,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (_) => UpdateProperty(
                      //                     property: property)));
                      //       },
                      //       icon: Icon(
                      //         Icons.edit,
                      //         size: 27,
                      //       ),
                      //     ),
                      //     IconButton(
                      //       onPressed: () {
                      //         delete(property.id!);
                      //         properties.removeAt(index);
                      //         setState(() {});
                      //       },
                      //       icon: Icon(
                      //         Icons.delete,
                      //         color: Colors.red,
                      //         size: 27,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
