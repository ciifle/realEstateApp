import 'package:flutter/material.dart';
import 'package:realestate/admin/services/property-service.dart';
import 'package:realestate/models/property_model.dart';
import 'package:realestate/user/pages/detail_page.dart';

class PropertyWidget extends StatefulWidget {
  const PropertyWidget({super.key});

  @override
  State<PropertyWidget> createState() => _PropertyWidgetState();
}

class _PropertyWidgetState extends State<PropertyWidget> {
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 320,
        child: ListView.builder(
            itemCount: properties.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var property = properties[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailPage(
                                // names: property.name,
                                // img: property.image,
                                // price: property.price.toString(),
                                // location: property.location,
                                // id: property.id.toString(),
                                property: property,
                              )));
                },
                child: Container(
                  width: 300,
                  height: 300,
                  margin: EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 170,
                        child: ClipRRect(
                          child: Image.network(
                            property.image,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        property.name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/location.png",
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            property.location,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .010,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          property.price.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
