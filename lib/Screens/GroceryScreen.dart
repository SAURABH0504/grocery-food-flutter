import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/Models/CartData.dart';
import 'package:vendor_app/Screens/ViewGrocery.dart';

import 'CartScreen.dart';

class GroceryScreen extends StatefulWidget {
  @override
  _GroceryScreenState createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  List<Cart> cart=[

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              // top menu containing search bar
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade200
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Text('Location',style: TextStyle(
                                  color: Colors.grey.shade400
                              ),),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: Icon(Icons.location_on,color: Colors.blue,),
                              onPressed: (){
                              },
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              //It contains Slider for banner and grid view of category
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Slider for banner
                      Expanded(
                        flex: 1,
                        child: CarouselSlider(
                          items: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: AssetImage('Images/1.jpg'),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: AssetImage('Images/2.jpg'),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: AssetImage('Images/3.jpg'),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: AssetImage('Images/4.jpg'),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: AssetImage('Images/5.jpg'),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            )
                          ],
                          options: CarouselOptions(
                              viewportFraction: 0.9,
                              height: 140,
                              autoPlayCurve: Curves.easeInCubic
                          ),
                        ),
                      ),
                      //GridView of category
                      Expanded(
                          flex: 7,
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  image: AssetImage('Images/green.jpg'),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          child: FlatButton(
                                            child: Text(' '),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewGrocery((cart){
                                                setState(() {
                                                  this.cart.add(cart);
                                                });
                                              })));
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('Category1'),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  image: AssetImage('Images/green.jpg'),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          child: FlatButton(
                                            child: Text(' '),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewGrocery((cart){
                                                this.cart.add(cart);
                                              })));
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('Category1'),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  image: AssetImage('Images/green.jpg'),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          child: FlatButton(
                                            child: Text(' '),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewGrocery((cart){
                                                this.cart.add(cart);
                                              })));
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('Category1'),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  image: AssetImage('Images/green.jpg'),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          child: FlatButton(
                                            child: Text(' '),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewGrocery((cart){
                                                this.cart.add(cart);
                                              })));
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('Category1'),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  image: AssetImage('Images/green.jpg'),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          child: FlatButton(
                                            child: Text(' '),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewGrocery((cart){
                                                this.cart.add(cart);
                                              })));
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('Category1'),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  image: AssetImage('Images/green.jpg'),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          child: FlatButton(
                                            child: Text(' '),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewGrocery((cart){
                                                this.cart.add(cart);
                                              })));
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('Category1'),
                                      )
                                    ],
                                  )
                              ),
                            ],
                          )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                        child: Center(
                                          child: FlatButton(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                      'Cart',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                        Icon(
                                                          Icons.shopping_cart,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                            ),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CartScreen(cart)));
                                            },
                                          color: Colors.purple,
                                      ),
                                        ),

                                    ),
                                  ]
                              ),

                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

