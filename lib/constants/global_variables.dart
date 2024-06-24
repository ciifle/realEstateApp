import "package:awesome_dialog/awesome_dialog.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

String url = "https://deegamoapp.onrender.com";

class GlobalVariable {
  static const secondryColor = Color(0xff003049);
  static const primaryColor = Color(0xff003040);
}

void showAwesome(
  BuildContext context,
  String text,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: Duration(seconds: 3),
  ));
}
