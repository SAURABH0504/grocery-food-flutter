import 'package:flutter/material.dart';
import 'package:vendor_app/Models/Vegetables.dart';

class ViewGrocery extends StatelessWidget {
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
      appBar: AppBar(
        title: Center(
          child: Text('Shop',style: TextStyle(
            color: Colors.purple,
            fontFamily: 'DancingScript',
          ),),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
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
      ),
    );
  }
}
