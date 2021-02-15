import 'package:flutter/material.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';

class PredictionsPage extends StatefulWidget {
  static const namedRoute = 'predictions_page';

  PredictionsPage({@required this.image});

  final File image;

  @override
  _PredictionsPageState createState() => _PredictionsPageState();
}

class _PredictionsPageState extends State<PredictionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Page'),
      ),
      body: Container(
        child: widget.image == null ? Text('') : Image.file(widget.image),
      ),
    );
  }
}
