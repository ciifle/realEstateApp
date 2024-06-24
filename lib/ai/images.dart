// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ImagePickerScreen extends StatefulWidget {
//   @override
//   _ImagePickerScreenState createState() => _ImagePickerScreenState();
// }

// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//   final ImagePicker _picker = ImagePicker();
//   List<XFile>? _imageFiles;

//   Future<void> pickImages() async {
//     try {
//       final pickedFiles = await _picker.pickMultiImage();
//       if (pickedFiles != null) {
//         setState(() {
//           _imageFiles = pickedFiles;
//         });
//       }
//     } catch (e) {
//       print("Error picking images: $e");
//     }
//   }

//   Future<void> uploadImages() async {
//     if (_imageFiles != null) {
//       for (XFile imageFile in _imageFiles!) {
//         await uploadImageToServer(imageFile);
//       }
//     }
//   }

//   Future<void> uploadImageToServer(XFile imageFile) async {
//     final uri = Uri.parse('http://your-server-url/upload');
//     final request = http.MultipartRequest('POST', uri)
//       ..files.add(await http.MultipartFile.fromPath(
//         'image',
//         imageFile.path,
//         contentType: MediaType('image', 'jpeg'),
//       ));
//     final response = await request.send();

//     if (response.statusCode == 200) {
//       print("Image uploaded successfully");
//     } else {
//       print("Image upload failed: ${response.statusCode}");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pick Images'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: pickImages,
//               child: Text('Pick Images'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: uploadImages,
//               child: Text('Upload Images'),
//             ),
//             if (_imageFiles != null)
//               Wrap(
//                 children: _imageFiles!.map((file) {
//                   return Image.file(
//                     File(file.path),
//                     width: 100,
//                     height: 100,
//                     fit: BoxFit.cover,
//                   );
//                 }).toList(),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
