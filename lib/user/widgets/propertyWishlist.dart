import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:realestate/admin/pages/updateProperty.dart';
import 'package:realestate/admin/services/property-service.dart';
import 'package:realestate/models/property_model.dart';
import 'package:realestate/provider/user_provider.dart';
import 'package:realestate/user/pages/detail_page.dart';
import 'package:realestate/user/services/detail_services.dart';

class PropertiesWishlist extends StatefulWidget {
  final int index;
  PropertiesWishlist({super.key, required this.index});

  @override
  State<PropertiesWishlist> createState() => _PropertiesWishlistState();
}

class _PropertiesWishlistState extends State<PropertiesWishlist> {
  final AdminPropertyServices adminPropertyServices = AdminPropertyServices();
  final DetailServices detailServices = DetailServices();
  //get properties from database

  void delete(int index) async {
    detailServices.removeFromWishlist(context: context, index: index);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var propertyWishlist =
        context.watch<UserProvider>().users.ratings![widget.index];
    var propertiess = Property.fromMap(propertyWishlist['property']);
    print(propertiess);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                  propertiess.image,
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
                propertiess.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Text(
                propertiess.price.toString() + "\$",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Text(
                propertiess.location,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () => delete(widget.index),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          // Spacer(),
        ],
      ),
    );
  }
}
