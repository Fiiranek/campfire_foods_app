import 'package:flutter/material.dart';

class ItemsCounterBar extends StatelessWidget {
  final int itemsNumber;
  const ItemsCounterBar({Key? key,required this.itemsNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.grey[400]),
      child: Text("Items in cart: ${itemsNumber.toString()}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
    );
  }
}
