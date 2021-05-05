import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reg_page/details.dart';

void main() {
  runApp(MyApp());
}
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String username;
  String dateofbirth;
  String location;
  String typeoffarm;
  String currentcrop;
  String areaoffarm;

  get setState => null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[50],
        body: Center(
         child: SingleChildScrollView(
           child: Column(
            children: <Widget>[
            Container(
            child: Stack(
               children:<Widget> [
               Container(
                 alignment: Alignment.topCenter,
                child: Text("Registration",
                style: TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.bold)),
        ),
        ],
      ),
    ),

                  Padding(
                   padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                   child: TextField(
                        decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "USERNAME",
                              enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                               color: Colors.black,
                      ),
                   ),
                       ),
                     onChanged: (value) => setState((){
                       username = value;
                     },
                     ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    labelText: "DATE OF BIRTH",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState((){
                  dateofbirth = value;
                  },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),

                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    labelText: "LOCATION",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState((){
                    location = value;
                  },
                  ),
                ),
              ),
              Container(
                child: Stack(
                  children:<Widget> [
                    Container(
                      padding:EdgeInsets.all(2),
                      child: Text(" Farm Details",
                          style: TextStyle(
                            color: Colors.black,
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),

                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.agriculture),
                    labelText: "TYPE OF FARM",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState((){
                  typeoffarm = value;
                  },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),

                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.rice_bowl),
                    labelText: "CURRENT CROP",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState((){
                    currentcrop = value;
                  },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    labelText: "AREA OF FARM",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState((){
                     areaoffarm = value;
                  },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
                child: MaterialButton(
                  elevation: 6,
                  height: 50,
                  child: Text("Submit",
                    style: TextStyle(
                             color: Colors.white,
                    ),
                  ),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (_) => details())
                    );
                  },
                ),
              ),
                ],
           ),
         ),
        ),
      ),
            );

  }
}

