import 'package:cff_ap/models/product.dart';

class OrderProduct {
  Product product;
  int quantity;

  Product get getProduct {
    return product;
  }

  int get getQuantity {
    return quantity;
  }

  OrderProduct(this.product, this.quantity);

  addQuantity(int addedQuantity){
    this.quantity += addedQuantity;
  }

  reduceQuantity(int reducedQuantity){
    this.quantity -= reducedQuantity;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Product: ${this.product}, quantity: ${this.quantity}";
  }
}
