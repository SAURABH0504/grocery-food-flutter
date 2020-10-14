import 'package:flutter/material.dart';
import 'package:vendor_app/Models/CartData.dart';
class CartScreen extends StatefulWidget {
  List<Cart> cart=[
  ];

  CartScreen(this.cart);
  @override
  _CartScreenState createState() => _CartScreenState(cart);
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> cart=[
  ];
  _CartScreenState(this.cart);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',style: TextStyle(
          color: Colors.purple
        ),
        ),
        backgroundColor: Colors.green.shade50,
      ),
      body: Container(
        child: Column(
          children: [
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
                            image: AssetImage(cart[index].vegetables.imageId),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(cart[index].vegetables.name, style: TextStyle(
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
                                                  Text(cart[index].vegetables.rating.toString(),
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
                                                  Text('Rs.'+cart[index].vegetables.price.toString()+'/Kg',
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Rs.'+(cart[index].vegetables.price*cart[index].quantity).toString(),
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        cart.removeAt(index);
                                      });
                                    },
                                  )

                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cart.length),
                ),
              ),
            ),
            Container(
              color: Colors.green.shade50,
              child: Expanded(
                flex: 1,
                child: Icon(
                  Icons.shopping_basket,
                  semanticLabel: 'CheckOut',
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
