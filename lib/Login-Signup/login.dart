import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vendor_app/Services/authservice.dart';
import 'package:vendor_app/screens/HomeScreen.dart';

class login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<login> {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final formKey = new GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  _googleLoginIn() async
  {
    try {
      await _googleSignIn.signIn();
      if (_googleSignIn.currentUser != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Home(),
        ));
      }
    }
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      appBar: AppBar(
        title: Center(
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
        backgroundColor: Colors.purple.shade400,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),

              Text(
                'Hello',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Center(
                child: Icon(
                  Icons.person_outline,
                  size: 75,
                  color: Colors.white,
                ),
              ),
              Text(
                'Login here',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20),
                              labelText: 'Phone No. ',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                this.phoneNo = "+91" + val;
                              });
                            },
                          )),
                      codeSent
                          ? Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20),
                              labelText: 'OTP',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                this.smsCode = val;
                              });
                            },
                          ))
                          : Container(),
                      Padding(
                          padding: EdgeInsets.fromLTRB(150, 30, 150, 50),
                          child: RaisedButton(
                              color: Colors.black,
                              child: Center(
                                  child: codeSent
                                      ? Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  )
                                      : Text(
                                    'Verify',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              onPressed: () {
                                codeSent
                                    ? AuthService()
                                    .signInWithOTP(smsCode, verificationId)
                                    : verifyPhone(phoneNo);
                              }))
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              FlatButton(

                onPressed: () {
                  AuthService().googleSignIn(context);
                },
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Image(
                        image: AssetImage('Images/googleIcon.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Text('SignIn with Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),),
                    ),
                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (Exception authException) {
      print('${authException.toString()}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 3),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}