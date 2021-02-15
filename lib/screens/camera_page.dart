import 'dart:io';
import 'package:flutter/material.dart';

import 'package:camera_app/screens/predictions_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera_app/utilities/bottom_button.dart';

class CameraPage extends StatefulWidget {
  static const namedRoute = 'camera_page';
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File image;

  Future takeImage(BuildContext context, ImageSource source) async {
    final navigator = Navigator.of(context);
    var cameraImage = await ImagePicker.pickImage(source: source);
    if (cameraImage != null) {
      // print(cameraImage.path);
      await navigator.push(
        MaterialPageRoute(
          builder: (context) => PredictionsPage(
            image: cameraImage,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFA9BBBC),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BottomButton(
              onPressed: () {
                takeImage(context, ImageSource.camera);
              },
              title: 'Take Photo',
              icon: Icons.camera_alt,
            ),
            SizedBox(
              height: 20.0,
            ),
            BottomButton(
              onPressed: () {
                takeImage(context, ImageSource.gallery);
              },
              title: 'From Gallery',
              icon: Icons.collections,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
