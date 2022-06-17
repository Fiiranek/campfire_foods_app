import 'package:cff_ap/screens/place_order.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  final List<Widget> widgets = [
    PlaceOrder(),
    PlaceOrder(),
    PlaceOrder(),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person))
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx){
          print(idx);
          setState(() {
            _index = idx;
          });
        },
        currentIndex: _index,

        items: [
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Place Order'),
        BottomNavigationBarItem(icon: Icon(Icons.list),label: 'View Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.restore_from_trash),label: 'Waste')
      ],

      ),
      // body: widgets[_index],
      body:PlaceOrder(),
    );
  }
}
