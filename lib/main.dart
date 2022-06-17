import 'package:cff_ap/models/order_product.dart';
import 'package:cff_ap/redux/reducers.dart';
import 'package:cff_ap/screens/login.dart';
import 'package:cff_ap/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/order.dart';

// import 'package:redux/redux.dart';
// import 'package:flutter_redux/flutter_redux.dart';
void main() {
  // final store = Store<List<OrderProduct>>(orderReducer(state, action));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Order>(create: (context) => Order())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme:
            ThemeData(splashColor: Colors.yellow, primarySwatch: Colors.brown),
        home: Wrapper());
        // home: Login());
  }
}
