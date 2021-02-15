import 'package:flutter/cupertino.dart';
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
  // St _results;
  String diseaseName;

  loadModel() async {
    var res = await Tflite.loadModel(
        model: "assets/model.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
    // print('$res');
  }

  predictDisease() async {
    //TODO: Image should be cropped before prediction
    var predictions = await Tflite.runModelOnImage(
        path: widget.image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );
    // print(predictions);
    setState(() {
      String diseaseIndex = predictions[0]['label'].toString()[0];
      if (diseaseIndex == '0') {
        diseaseName = 'Tomato is Healthy';
      } else if (diseaseIndex == '1') {
        diseaseName = 'Leaf Mold';
      } else if (diseaseIndex == '2') {
        diseaseName = 'Bacterial Spot';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel();
    predictDisease();
  }

  @override
  void dispose() async {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFA9BBBC),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.image == null ? Text('') : Image.file(widget.image),
              SizedBox(
                height: 20.0,
              ),
              diseaseName == null
                  ? Text('Try Again')
                  : Text(
                      '$diseaseName',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
              SizedBox(
                height: 100.0,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_left),
                label: Text('Back'),
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
