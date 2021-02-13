import 'dart:io';

import 'package:camera_app/screens/predictions_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:camera_app/utilities/bottom_button.dart';

class CameraPage extends StatefulWidget {
  static const namedRoute = 'camera_page';
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File image;

  Future openCamera() async {
    var cameraImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = cameraImage;
    });
  }

  // Function to open a local gallery
  Future openGalley() async {
    var galleryImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = galleryImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFA9BBBC),
        appBar: AppBar(
          title: Text('Camera Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BottomButton(
              onPressed: () {
                openCamera();
                if (image != null) {
                  Navigator.pushNamed(
                    context,
                    PredictionsPage.namedRoute,
                    arguments: {
                      'image': image,
                    },
                  );
                }
              },
              title: 'Take Photo',
              icon: Icons.camera_alt,
            ),
            SizedBox(
              height: 20.0,
            ),
            BottomButton(
              onPressed: () {
                openGalley();
              },
              title: 'From Gallery',
              icon: Icons.collections,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
    );
  }
}
