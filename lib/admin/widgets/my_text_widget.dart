import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  int maxLine;
  final TextEditingController controller;
   MyTextWidget({    
    super.key,
    required this.hintText,
    this.maxLine = 1,
    required this.controller,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText can't be empty";
          }
        },
        maxLines: maxLine,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(    
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xff003049),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff003049),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff003049),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
