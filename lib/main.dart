import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Login-Signup/login.dart';
import 'Login-Signup/login.dart';
import 'Screens/HomeScreen.dart';

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
      navigateAfterSeconds: login(),
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
