import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_number_auth/home_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber, verificationId, smsCode;
  bool showSpinner = false;

  Future<void> loginUser(BuildContext context, String phoneNumber) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop;

          final result = await _auth.signInWithCredential(credential);

          User user = result.user;
          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  user: user,
                ),
              ),
            );
          } else {
            print('Error');
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text('Enter OTP'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        decoration:
                            InputDecoration(hintText: 'Enter OTP Recieved'),
                        onChanged: (value) {
                          smsCode = value;
                        },
                      ),
                    ],
                  ),
                  actions: [
                    FlatButton(
                      child: Text('Confirm'),
                      onPressed: () async {
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: smsCode);

                        final result =
                            await _auth.signInWithCredential(credential);

                        User user = result.user;

                        if (user != null) {
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        user: user,
                                      )));
                        } else {
                          print('SMs code Error');
                        }
                      },
                    ),
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Sign In'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: CircularProgressIndicator(),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                decoration:
                    InputDecoration(hintText: 'Enter Your Phone Number'),
                onChanged: (value) {
                  phoneNumber = value;
                  print(phoneNumber);
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  loginUser(context, phoneNumber);
                  setState(() {
                    showSpinner = true;
                  });
                },
                label: Text('Send OTP'),
              ),
              SizedBox(
                height: 30.0,
              ),

              SizedBox(
                height: 30.0,
              ),
              // RaisedButton(
              //   onPressed: () {
              //   },
              //   child: Center(
              //     child: Text('Login'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
