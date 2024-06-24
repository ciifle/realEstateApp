import 'package:flutter/material.dart';

class PhotosWidget extends StatelessWidget {
  const PhotosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List images = [
      "Rooms",
      "WashRoom",
      "Kitchen",
    ];
    List ciifle = [
      "Colleges",
      "Schools",
      "Universities",
      "Colleges",
      "Schools",
    ];
    List icons = [
      Icons.bed,
      Icons.wash,
      Icons.kitchen,
    ];
    return SizedBox(
      height: size.height * .12,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    icons[index],
                    color: Colors.grey.shade600,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    images[index],
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
