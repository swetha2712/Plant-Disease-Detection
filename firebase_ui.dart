import 'package:firebase_auth_ui/firebase_auth_ui.dart';
import 'package:firebase_auth_ui/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class FireBaseUIPage extends StatefulWidget {
  @override
  _FireBaseUIPageState createState() => _FireBaseUIPageState();
}

class _FireBaseUIPageState extends State<FireBaseUIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            launchFirebaseUi();
          },
          child: Text('Log IN'),
        ),
      ),
    );
  }

  Future launchFirebaseUi() async {
    await FirebaseAuthUi.instance()
        .launchAuth(
          [
            AuthProvider.phone(), // Login with Phone number
          ],
        )
        .then((firebaseUser) =>
            print("Logged in user is ${firebaseUser.displayName}"))
        .catchError((error) => print("Error $error"));
  }
}
