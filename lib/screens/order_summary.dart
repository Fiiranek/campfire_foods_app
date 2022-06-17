import 'package:cff_ap/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order summary"),
        ),
        body: Consumer<Order>(builder: (context, order, child) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.grey[400]),
                  child: Text("Items in cart: ${order.caulculateTotalOrderItemsNumber()}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                )
              ],
            ),
          );
        }));
  }
}
