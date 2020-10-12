import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/screens/HomeScreen.dart';
import 'package:vendor_app/Login-Signup//login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  GoogleSignIn _googleSignIn = GoogleSignIn();

  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        // ignore: deprecated_member_use
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return login();
          }
        });
  }


  //Sign out
  signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    _googleSignIn.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder:(context)=> login()
    ));
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    // ignore: deprecated_member_use
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }


  googleSignIn(BuildContext context) async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    print(googleUser);
    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;

      print(googleAuth);

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>Home()
      ));
    }
    else{
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Something went wrong",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, fontWeight:
            FontWeight.bold),), duration: Duration(seconds: 2), backgroundColor: Colors.red,)
      );
    }
  }

}