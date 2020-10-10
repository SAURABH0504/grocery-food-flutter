import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:vendor_app/Screens/HomeScreen.dart';

class login extends StatelessWidget {

  TextEditingController username;
  TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(
            child: Text('Login',style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),)),
          backgroundColor: Colors.purple.shade400,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello',style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                ),
                ),
                Center(
                  child: Icon(
                    Icons.person_outline,
                    size: 75,
                    color: Colors.white,
                  ),
                ),
                Text('Login here',style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: username,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 10,
                  color: Colors.purple.shade700,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      labelText: 'password',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
                Divider(
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  color: Colors.black,
                                  child: Text('Log in',style: TextStyle(
                                      color: Colors.white
                                  ),),
                                  onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                                  },
                                ),
                              ),
                          ),
                          SizedBox(
                            width: 15,
                            height: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  color: Colors.black,
                                  child: Text('Sign in',style: TextStyle(
                                      color: Colors.white
                                  ),),
                                  onPressed: (){
                                  },
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Linkify(
                  onOpen: (link)=>'',
                  text: 'Forgot password?',
                ),
                Divider(
                ),
                Linkify(
                  onOpen: (link)=>'',
                  text: 'Help',
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.purple.shade700,
      ),
    );
  }
}
