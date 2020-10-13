import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:vendor_app/Login-Signup/AuthServices.dart';

void main() {
  runApp(new MaterialApp(
      home: MyApp()
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(seconds: 2,
      navigateAfterSeconds: FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return null;
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return AuthService().handleAuth();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return null;
        },
      ),
      title: Text('Welcome',style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),),
      image: Image(
        image: AssetImage('Images/logo.jpg'),
      ),
      backgroundColor: Colors.purple.shade400,
      photoSize: 100,
    );
  }
}
