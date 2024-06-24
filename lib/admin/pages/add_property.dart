import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate/admin/services/property-service.dart';
import 'package:realestate/admin/widgets/my_text_widget.dart';

class AddProperty extends StatefulWidget {
  static const routeName = "/add";
  const AddProperty({super.key});

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final TextEditingController name = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AdminPropertyServices adminPropertyServices = AdminPropertyServices();
  //rooms images picker
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles;
  Future<void> pickImages() async {
    try {
      final pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles != null) {
        setState(() {
          _imageFiles = pickedFiles;
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  // another image
  File? _image;
  void _pickImages() async {
    List<File> images = [];
    try {
      var pickImage = await ImagePicker().pickMultiImage(limit: 6);
      if (pickImage != null) {
        for (int i = 0; i < pickImage.length; i++) {
          setState(() {
            _image = File(pickImage[i].path);
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //save
  void save() {
    if (formKey.currentState!.validate()) {
      adminPropertyServices.saveProperty(
        context: context,
        name: name.text,
        location: location.text,
        price: double.parse(price.text),
        image: _image!,
        desc: desc.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Property",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0xff003049),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: GestureDetector(
                onTap: _pickImages,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xff003049),
                      width: 5,
                    ),
                  ),
                  child: _image != null
                      ? Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/gallery.png",
                              width: 70,
                              height: 70,
                            ),
                            Text(
                              "Upload Image",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            MyTextWidget(
              hintText: "Name",
              controller: name,
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: 15,
            ),
            MyTextWidget(
              hintText: "Location",
              controller: location,
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: 15,
            ),
            MyTextWidget(
              hintText: "Price",
              controller: price,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 15,
            ),
            MyTextWidget(
              maxLine: 3,
              hintText: "description",
              controller: desc,
              textInputType: TextInputType.text,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: InkWell(
                onTap: save,
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff003049),
                  ),
                  child: Center(
                      child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
