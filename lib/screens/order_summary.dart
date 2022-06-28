import 'package:cff_ap/components/items_counter_bar.dart';
import 'package:cff_ap/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Order>(builder: (context, order, child) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order summary"),
        ),
        body: Consumer<Order>(builder: (context, order, child) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ItemsCounterBar(
                    itemsNumber: order.caulculateTotalOrderItemsNumber()),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text('Order Overview:',style: TextStyle(fontSize: 22),),
                      SizedBox(height: 20,),
                      Container(
                        child: Column(
                          children: [
                            Text('Location:',style: TextStyle(fontSize: 16,color: Colors.grey),),
                            SizedBox(height:3),
                            Text(order.orderLocation)
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Column(
                          children: [
                            Text('Delivery Date:',style: TextStyle(fontSize: 16,color: Colors.grey),),
                            SizedBox(height:3),
                            Text(DateFormat.yMMMMEEEEd().format(order.orderDate))
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text('Products Ordered:',style: TextStyle(fontSize: 16,color: Colors.grey),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                        itemCount: order.orderList.length,
                        itemBuilder: (context,index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(order.orderList[index].getProduct.getName,style: TextStyle(fontSize: 18),),
                              Text(order.orderList[index].getQuantity.toString(),style: TextStyle(fontSize: 18),),
                            ],
                          );
                        }),
                      )


                    ],
                  ),
                )
              ],
            ),
          );
        }));
  });
  }
}
