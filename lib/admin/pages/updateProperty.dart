import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate/admin/services/property-service.dart';
import 'package:realestate/admin/widgets/my_text_widget.dart';
import 'package:realestate/models/property_model.dart';

class UpdateProperty extends StatefulWidget {
  static const routeName = "/update";
  final Property property;
  const UpdateProperty({super.key, required this.property});

  @override
  State<UpdateProperty> createState() => _UpdatePropertyState();
}

class _UpdatePropertyState extends State<UpdateProperty> {
  final TextEditingController name = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AdminPropertyServices adminPropertyServices = AdminPropertyServices();
  //image picker
  File? _image;
  void _pickImage() async {
    try {
      var pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        setState(() {
          _image = File(pickImage.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    print("id" + widget.property.id!);
    name.text = widget.property.name;
    desc.text = widget.property.desc;
    location.text = widget.property.location;
    price.text = widget.property.price.toString();
    super.initState();
  }

  //Update
  void update() {
    if (formKey.currentState!.validate()) {
      adminPropertyServices.updateProperty(
        context: context,
        id: widget.property.id!,
        name: name.text,
        location: location.text,
        image: _image,
        oldImage: widget.property.image,
        price: double.parse(price.text),
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
          "Update Property",
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
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 220,
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
                      : Image.network(
                          widget.property.image,
                          fit: BoxFit.cover,
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
              hintText: "Description",
              controller: desc,
              textInputType: TextInputType.text,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: InkWell(
                onTap: widget.property.id != null ? update : null,
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff003049),
                  ),
                  child: Center(
                      child: Text(
                    "Update",
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
