import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/Models/Food.dart';

class FoodDeliveryScreen extends StatelessWidget {
  List<Food> food=[
    Food('Veg Burger',2.5,4.5,'Burger King, Wall street','Images/burger.jpg'),
    Food('Veg Burger',2.5,4.5,'Burger King, Wall street','Images/burger.jpg'),
    Food('Veg Burger',2.5,4.5,'Burger King, Wall street','Images/burger.jpg'),
    Food('Veg Burger',2.5,4.5,'Burger King, Wall street','Images/burger.jpg'),
    Food('Veg Burger',2.5,4.5,'Burger King, Wall street','Images/burger.jpg'),
    Food('Veg Burger',2.5,4.5,'Burger King, Wall street','Images/burger.jpg'),
    Food('Veg Burger',2.5,4.5,'Burger King, Wall street','Images/burger.jpg'),
    Food('Veg Burger',2.5,4.5,'Burger King, Wall street','Images/burger.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Expanded(
           flex: 1,
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
             ),
           )
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
                                   borderRadius: BorderRadius.circular(25),
                                   image: DecorationImage(
                                       image: AssetImage('food/food1.jpg'),
                                       fit: BoxFit.cover
                                   )
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   image: DecorationImage(
                                       image: AssetImage('food/food2.jpg'),
                                       fit: BoxFit.cover
                                   )
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   image: DecorationImage(
                                       image: AssetImage('food/food3.jpg'),
                                       fit: BoxFit.cover
                                   )
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(25),
                                   image: DecorationImage(
                                       image: AssetImage('food/food4.jpg'),
                                       fit: BoxFit.cover
                                   )
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(25),
                                   image: DecorationImage(
                                       image: AssetImage('food/food5.jpg'),
                                       fit: BoxFit.cover
                                   )
                               ),
                             )
                           ],
                           options: CarouselOptions(
                               viewportFraction: 0.6,
                               height: 70,
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
                                     image: AssetImage(food[index].imageId),
                                   ),
                                 ),
                                 Expanded(
                                   flex: 3,
                                   child: Column(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Text(food[index].name,style: TextStyle(
                                             fontWeight: FontWeight.bold,
                                             fontSize: 15
                                         ),),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Text(food[index].restaurent,style: TextStyle(
                                             fontSize: 12
                                         ),),
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
                                                   Text(food[index].rating.toString(),style: TextStyle(
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
                                                   Text(food[index].price.toString(),style: TextStyle(
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
                           }, separatorBuilder: (context,index) => Divider(), itemCount: food.length),
                         ),
                       )
                     ]
                 ),
               ),
             ],
           ),
         );
  }
}