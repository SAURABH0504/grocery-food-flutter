import 'package:flutter/material.dart';
import 'package:vendor_app/Models/CartData.dart';
import 'package:vendor_app/Models/Vegetables.dart';

class ViewGrocery extends StatefulWidget {
  final ValueSetter<Cart> cart;
  ViewGrocery(this.cart);
  @override
  _ViewGroceryState createState() => _ViewGroceryState(cart);
}

  class _ViewGroceryState extends State<ViewGrocery> {
  ValueSetter<Cart> cart;
  _ViewGroceryState(this.cart);
  Color _buttonColor=Colors.teal.shade50;
  List<Cart> vegetables=[
   Cart(Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),0),
    Cart(Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),0),
    Cart(Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),0),
    Cart(Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),0),
    Cart(Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),0),
    Cart(Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),0),
    Cart(Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),0),
    Cart(Vegetables('Tomato',120,3.5,'Images/tomato.jpg'),0),
  ];
  List<bool> check = List.filled(9, false);

  int n=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
              ),
            ),
             Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade200
                  ),
                  child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Item',
                        ),
                        onChanged: (value){
                        },
                        textAlign: TextAlign.center,
                      )
                    ),
                ),
              ),
            ),
             Expanded(
               flex: 15,
               child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(itemBuilder: (context, index) {

                      return Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image(
                              image: AssetImage(vegetables[index].vegetables.imageId),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(vegetables[index].vegetables.name, style: TextStyle(
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
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                            ),
                                            Text(vegetables[index].vegetables.rating.toString(),
                                                style: TextStyle(
                                                    fontSize: 10
                                                )),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.navigate_next,
                                              size: 10,
                                            ),
                                            Text('Rs.'+vegetables[index].vegetables.price.toString()+'/Kg',
                                                style: TextStyle(
                                                    fontSize: 10
                                                )),
                                          ],
                                        ),
                                      ),
                        ]
                      )
                      ),
                      ]
                            )
                      ),
                          Expanded(
                            flex: 2,
                             child: Column(
                               children: [
                                   Row(
                                     children: [
                                       IconButton(
                                         icon: Icon(Icons.remove),
                                         highlightColor: Colors.red,
                                         onPressed: (){
                                           setState(() {
                                             if(vegetables[index].quantity>0)
                                             {
                                               vegetables[index].quantity--;
                                             }
                                           });
                                         },
                                       ),
                                       Text('${vegetables[index].quantity}'),
                                       IconButton(
                                         icon: Icon(Icons.add),
                                         highlightColor: Colors.red,
                                         onPressed: (){
                                           setState(() {
                                             vegetables[index].quantity++;
                                           });
                                         },
                                       ),
                                     ],
                                   ),
                                 Padding(
                                   padding: const EdgeInsets.all(3.0),
                                   child: Container(
                                     child: FlatButton(
                                       child: check[index] ? Text(
                                         'Added',style: TextStyle(
                                         fontSize: 10,
                                         color: Colors.red
                                       ),
                                       ):Text(
                                         'Add',style: TextStyle(
                                           fontSize: 10,
                                            color: Colors.blue,
                                       ),
                                       ),
                                       onPressed: (){
                                         setState(() {
                                           Cart c=vegetables[index];
                                           if(check[index] == false && c.quantity>0)
                                              {
                                               cart(c);
                                               print(c.quantity);
                                               check[index]=true;
                                               n++;
                                              }
                                         });
                                         }
                                     ),
                                     color: _buttonColor,
                                   ),
                                 )
                               ],
                             ),
                          )
                        ],
                      );
                    },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: vegetables.length),
                  ),
                ),
             ),
          ]
        ),
      ),
    );
  }
}
