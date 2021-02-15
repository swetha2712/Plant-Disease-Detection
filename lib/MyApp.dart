import 'package:flutter/material.dart';

import 'package:camera_app/screens/predictions_page.dart';
import 'package:camera_app/screens/camera_page.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CameraPage.namedRoute,
      routes: {
        CameraPage.namedRoute: (context) => CameraPage(),
        PredictionsPage.namedRoute: (context) => PredictionsPage(image: null),
      },
    );
  }
}



// import 'package:camera_app/screens/predictions_page_design.dart';
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: PageDesign(),
//     );
//   }
// }
