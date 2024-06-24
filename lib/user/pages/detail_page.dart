import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/widgets.dart';
import 'package:realestate/models/property_model.dart';
import 'package:realestate/user/services/detail_services.dart';
import 'package:realestate/user/widgets/photosWidget.dart';

class DetailPage extends StatefulWidget {
  static const routeName = "/detail";
  final Property property;
  const DetailPage({
    super.key,
    // required this.id,
    // required this.names,
    // required this.img,
    // required this.price,
    // required this.location,
    required this.property,
  });
  // final String id;
  // final String names;
  // final String img;
  // final String price;
  // final String location;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailServices detailServices = DetailServices();
  void addToWishList() async {
    detailServices.addToWishlist(
        context: context, propertyId: widget.property.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: size.height * .40,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: size.height * .40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        image: NetworkImage(widget.property.image),
                        fit: BoxFit.cover),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.76),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: addToWishList,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.76),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          size: 25,
                          color: Color.fromARGB(255, 236, 178, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: size.height * .60,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .010,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.property.name,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff003049),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.property.price.toString() + "\$",
                        style: TextStyle(
                          fontSize: 26,
                          color: Color(0xff003049),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.property.location,
                        style: TextStyle(
                          color: Color(0xff003049),
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .020,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "Property Details",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff003049),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Text(
                    widget.property.desc,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff003049),
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                // PhotosWidget(),
                SizedBox(
                  height: size.height * .080,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Color(0xff003049).withOpacity(.45),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
