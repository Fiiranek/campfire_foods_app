import 'package:cff_ap/models/order_product.dart';
import 'package:cff_ap/models/product.dart';

import 'order_product.dart';
import 'order_product.dart';
import 'order_product.dart';

class OrderSummary {
  List<OrderProduct> orderList;
  String location;
  DateTime date;

  List<OrderProduct> get getOrderList{
    return orderList;
  }

  String get getLocation{
    return location;
  }

  DateTime get getDate {
    return date;
  }

  OrderSummary(this.orderList, this.location,this.date);
}
