import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NormalCamera extends StatefulWidget {
  @override
  _NormalCameraState createState() => _NormalCameraState();
}

class _NormalCameraState extends State<NormalCamera> {
  File image;

  Future openCamera() async {
    var cameraImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = cameraImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Normal Camera'),
      ),
      body: Column(
        children: [
          Container(
            child: image == null ? Text('Image') : Image.file(image),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openCamera();
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
