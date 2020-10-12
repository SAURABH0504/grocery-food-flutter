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
    return MaterialApp(
        home: DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Vendor',style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 35,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold
                  ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.search,color: Colors.black,
                        ),
                        onPressed: (){
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.menu,color: Colors.black,
                        ),
                        onPressed: (){

                        },
                      ),

                    ],
                  )

                )
              ],
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              unselectedLabelColor: Colors.purple,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.purple,
              ),
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Tab(child: Text(
                    'Grocery',style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 25
                  ),
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Tab(child: Text(
                    'Food',style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 25
                  ),
                  )),
                ),
              ],
            ),
          ),
          body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
                    children: [
                      GroceryScreen(),
                      FoodDeliveryScreen()
                    ],
                  ),
          ),
              ),
          length: 2,
          initialIndex: 0,
        ),
      );
  }
}

