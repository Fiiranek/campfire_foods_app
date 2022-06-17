import 'package:cff_ap/models/order_product.dart';
import 'package:flutter/cupertino.dart';

import 'product.dart';

class Order extends ChangeNotifier {
  List<OrderProduct> orderList = [
    // new OrderProduct(new Product('rib', 'xyz'), 1),
    // new OrderProduct(new Product('apple', 'appleid'), 10),
  ];

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
