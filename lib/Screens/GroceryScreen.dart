import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/Models/Vegetables.dart';

class GroceryScreen extends StatelessWidget {
  List<Vegetables> vegetables=[
    Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),
    Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),
    Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),
    Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),
    Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),
    Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),
    Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),
    Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),
    Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
               Expanded(
                 flex: 1,
                 child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            child: Text('Your Location',style: TextStyle(
                              color: Colors.orange
                            ),),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                        ),
                        onPressed: (){
                        },
                      ),
                    )
                  ],
              ),
               ),
              Divider(
              thickness: 1,
               ),
               Expanded(
                 flex: 10,
                 child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CarouselSlider(
                          items: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: AssetImage('Images/1.jpg'),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage('Images/2.jpg'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage('Images/3.jpg'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: AssetImage('Images/4.jpg'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: AssetImage('Images/5.jpg'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            )
                          ],
                          options: CarouselOptions(
                            viewportFraction: 0.8,
                            height: 100,
                            autoPlayCurve: Curves.easeInCubic
                          ),
                        ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView.separated(itemBuilder: (context,index){
                          return Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image(
                                  image: AssetImage(vegetables[index].imageId),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(vegetables[index].name,style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                        ),),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 10,
                                                ),
                                                Text(vegetables[index].rating.toString(),style: TextStyle(
                                                    fontSize: 10
                                                )),
                                              ],
                                            ),
                                            ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.attach_money,
                                                      size: 10,
                                                    ),
                                                    Text(vegetables[index].price.toString(),style: TextStyle(
                                                        fontSize: 10
                                                    )),
                                                  ],
                                                ),
                                              )
                                        ],
                                        ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }, separatorBuilder: (context,index) => Divider(), itemCount: vegetables.length),
                      ),
                    )
                  ]
              ),
               ),
          ],
        ),
      ),
    );
  }
}
