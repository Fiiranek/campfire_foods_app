import 'package:cff_ap/components/items_counter_bar.dart';
import 'package:cff_ap/models/order.dart';
import 'package:cff_ap/models/order_product.dart';
import 'package:cff_ap/models/product.dart';
import 'package:cff_ap/screens/order_summary.dart';
import 'package:cff_ap/screens/schedule_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  final TextEditingController searchController = new TextEditingController();

  List<Product> initialProducts = [
    Product("Pulled pork", '1'),
    Product("Ribs", '2'),
    Product("Apple", '3'),
    Product("Carrot", '4'),
    Product("Bread", '5'),
  ];
  List<Product> products = [];
  List<OrderProduct> orderProducts = [];

  void search(String _text) {
    setState(() {
      if (_text.length < 1) {
        // empty
        products = initialProducts;
      } else {
        print('Searching element containing "' + _text.toLowerCase() + '"');
        products = initialProducts
            .where((element) => element.name
                .toString()
                .toLowerCase()
                .contains(_text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    products = initialProducts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Order>(builder: (context, order, child) {
      return Container(
        child: Column(
          children: [
            ItemsCounterBar(
                itemsNumber: order.caulculateTotalOrderItemsNumber()),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    title: Text('Delete'),
                                    content:
                                        Text('Do you want to clear the order?'),
                                    actionsAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            order.clearOrder();
                                            Navigator.pop(ctx);
                                          },
                                          child: Text('YES')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                          },
                                          child: Text('CANCEL'))
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.delete))),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: searchController,
                      onChanged: (val) {
                        search(searchController.text);
                      },
                      decoration: InputDecoration(
                          hintText: 'Search product',
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: searchController.text.length > 0
                              ? IconButton(
                                  onPressed: () {
                                    this.setState(() {
                                      products = initialProducts;
                                      searchController.clear();
                                    });
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  icon: Icon(Icons.cancel))
                              : null,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, color: Colors.white))),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                // context,MaterialPageRoute(builder: (context) => const OrderSummary())
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ScheduleOrder()));
                          },
                          icon: Icon(Icons.shopping_cart))),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (ctx, index) {
                    Product product = products[index];

                    List<OrderProduct> filteredProducts = order.orderList
                        .where((p) => p.product.getId == product.getId)
                        .toList();
                    int productQuantity = filteredProducts.length > 0
                        ? filteredProducts[0].getQuantity
                        : 0;
                    TextEditingController controller =
                        new TextEditingController(
                            text: productQuantity.toString());
                    controller.text = filteredProducts.length > 0
                        ? filteredProducts[0].getQuantity.toString()
                        : 0.toString();

                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image.network(
                              "https://static.fajnegotowanie.pl/media/uploads/media_image/original/przepis/304/zeberka-w-sosie-barbeque.jpg",
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(products[index].name,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              order.removeProductFromOrder(
                                                  product, 1);
                                            },
                                            icon: Icon(Icons.remove_circle,
                                                size: 36)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 20,
                                          child:
                                              // TextField(
                                              //   // keyboardType: K,
                                              //
                                              //   decoration: InputDecoration(
                                              //
                                              //     contentPadding:
                                              //         EdgeInsets.symmetric(
                                              //             vertical: 0,
                                              //             horizontal: 10),
                                              //     border: OutlineInputBorder(
                                              //       borderRadius:
                                              //           BorderRadius.circular(30),
                                              //     ),
                                              //   ),
                                              //   controller: controller,
                                              //
                                              // ),
                                              Text(
                                            (order.orderList.any((element) =>
                                                    element.product.getId ==
                                                    product.getId)
                                                ? order.orderList
                                                    .firstWhere((element) =>
                                                        element.product.getId ==
                                                        product.getId)
                                                    .getQuantity
                                                    .toString()
                                                : "0"),
                                            style: TextStyle(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              order.addProductToOrder(
                                                  product, 1);
                                            },
                                            icon: Icon(Icons.add_circle,
                                                size: 36)),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(products[index].name,
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),
                                    Text("100",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.orange)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // ),
                    );
                  }),
            )
          ],
        ),
      );
    });
  }
}
