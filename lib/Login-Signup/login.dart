import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vendor_app/Login-Signup/AuthServices.dart';
import 'package:vendor_app/Screens/HomeScreen.dart';

class login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<login> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  String userName;
  String userImageUrl;
  String phoneNo, verificationId, smsCode;
  bool codeSent = false;

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
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.symmetric(),
                    color: Colors.white,

                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  fillColor: Colors.black,
                                  hintText: 'Enter your number',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )
                              ),
                              maxLengthEnforced: false,
                              onChanged: (val) {
                                setState(() {
                                  val = '+91 ' + val;
                                  this.phoneNo = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              codeSent ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.symmetric(),
                    color: Colors.white,

                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  fillColor: Colors.black,
                                  hintText: 'Enter OTP',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )
                              ),
                              maxLengthEnforced: false,
                              onChanged: (val) {
                                setState(() {
                                  this.smsCode = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ) : Container(),
              OutlineButton(
                borderSide: BorderSide(
                    width: 1,
                    color: Colors.white
                ),
                hoverColor: Colors.white,
                highlightedBorderColor: Colors.white,
                child: codeSent ? Text(
                  'LogIn', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
                ) : Text(
                  'Verify', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
                ),
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  codeSent ? AuthService().signInWithOTP(
                      smsCode, verificationId) : verifyPhone(phoneNo);
                },
              ),
              Text(
                'or', style: TextStyle(
                  fontSize: 20,
                  color: Colors.white38
              ),

              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('Images/googleIcon.jpg'),
                    backgroundColor: Colors.white,
                    radius: 25,
                  ),
                  onPressed: () async{
                    if(await signInwithGoogle() != false)
                      {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Home()));
                      }
                  }
              ),
              Text('Sign in with Google')
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(phoneNo);
    };
    final PhoneVerificationFailed verificationFailed = (
        FirebaseAuthException authException) {
      print('${authException.message}');
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

    await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: phoneNo,
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
      timeout: const Duration(seconds: 5),
    );
  }
  Future<bool> signInwithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn
        .signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await
    googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await
    firebaseAuth.signInWithCredential(credential);
    final User user = authResult.user;
    if (user != null) {
      assert(user.displayName != null);
      assert(user.email != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final User currentUser = firebaseAuth.currentUser;
      assert(user.uid == currentUser.uid);
      return true;
    }
    return false;
  }
}