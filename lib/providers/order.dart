import 'package:cff_ap/models/order_product.dart';
import 'package:flutter/cupertino.dart';

import '../models/product.dart';

class Order extends ChangeNotifier {
  List<OrderProduct> orderList = [];

  // late OrderSummary orderSummary;

  String orderLocation = "Cincinatti";
  DateTime orderDate = new DateTime(2020);

  void setOrderLocation(String newOrderLocation){
    orderLocation = newOrderLocation;
    notifyListeners();
  }

  void setOrderDate(DateTime newOrderDate){
    orderDate =  newOrderDate;
    notifyListeners();
  }

  void addProductToOrder(Product product, int quantity) {
    bool isProductAlreadyInOrder =
        orderList.any((p) => p.product.getId == product.getId);
    if (isProductAlreadyInOrder) {
      int productIndex =
          orderList.indexWhere((p) => p.product.getId == product.getId);
      orderList[productIndex].addQuantity(quantity);
    } else {
      orderList.add(new OrderProduct(product, quantity));
    }
    print(orderList);
    notifyListeners();
  }

  void removeProductFromOrder(Product product, int quantity) {
    bool isProductAlreadyInOrder =
        orderList.any((p) => p.product.getId == product.getId);
    if (isProductAlreadyInOrder) {
      int productIndex =
          orderList.indexWhere((p) => p.product.getId == product.getId);
      orderList[productIndex].reduceQuantity(quantity);
      if (orderList[productIndex].getQuantity <= 0) {
        orderList.removeAt(productIndex);
      }
      print(orderList);
      notifyListeners();
    }
  }

  void clearOrder() {
    orderList = [];
    notifyListeners();
  }

  int caulculateTotalOrderItemsNumber() {
    int total = 0;
    for (OrderProduct product in orderList) {
      total += product.getQuantity;
    }
    return total;
  }
}
