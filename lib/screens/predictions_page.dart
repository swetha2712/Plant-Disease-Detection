import 'package:flutter/material.dart';
import 'dart:io';

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
        title: Text('Predictions Page'),
      ),
      body:
          widget.image == null ? Text('Not Loaded') : Image.file(widget.image),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.arrow_right,
        ),
      ),
    );
  }
}
