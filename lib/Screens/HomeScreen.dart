import 'package:flutter/material.dart';
import 'package:vendor_app/Screens/FoodDeliveryScreen.dart';
import 'package:vendor_app/Screens/GroceryScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              unselectedLabelColor: Colors.purple,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.purple,
              ),
              tabs: [
                Tab(child: Text(
                  'Grocery',style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 30
                ),
                ),),
                Tab(child: Text(
                  'Food',style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 30
                ),
                )),
              ],
            ),
            backgroundColor: Colors.white,
          ),
          body: TabBarView(
                  children: [
                    GroceryScreen(),
                    FoodDeliveryScreen()
                  ],
                ),
              ),
          length: 2,
          initialIndex: 0,
        ),
      );
  }
}

