// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:realestate/models/rating.dart';

class Property {
  final String name;
  final String location;
  final String desc;
  final String image;
  final double price;
  final String? id;
  // final List<Rating>? rating;
  Property( {
    required this.name,
    required this.desc, 
    required this.location,
    required this.image,
    required this.price,
    this.id,
    // this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'location': location,
      'image': image,
      'price': price,
      'desc':desc,
      'id': id,
      //'rating': rating,
    };
  }

  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      name: map['name'] ?? "",
      location: map['location'] ?? "",
      image: map['image'] ?? "",
      price: map['price'] ?? 0.0,
      id: map['_id'] ?? "",
      desc: map['desc'] ?? "",
      // roomsImages: List<Map<String, dynamic>>.from(
      //     (map['roomsImages']?.map((x) => Map<String, dynamic>.from(x)))),
      //rating: map['rating'] != null ? List<Rating>.from((map['rating'] as List<int>).map<Rating?>((x) => Rating.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Property.fromJson(String source) =>
      Property.fromMap(json.decode(source) as Map<String, dynamic>);
}
