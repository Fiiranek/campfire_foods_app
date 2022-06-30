import 'package:cff_ap/providers/user.dart';
import 'package:cff_ap/screens/place_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> widgets = [
    PlaceOrder(),
    PlaceOrder(),
    PlaceOrder(),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, auth, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            IconButton(onPressed: () {
              auth.logout();
            }, icon: Icon(Icons.logout)),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          onTap: (idx) {
            setState(() {
              _index = idx;
            });
          },
          currentIndex: _index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Place Order'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'View Orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.restore_from_trash), label: 'Waste')
          ],
        ),
        body: widgets[_index],
        // body: PlaceOrder(),
      );
    });
  }
}
