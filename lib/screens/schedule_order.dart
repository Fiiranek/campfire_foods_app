import 'package:cff_ap/components/items_counter_bar.dart';
import 'package:cff_ap/providers/order.dart';
import 'package:cff_ap/screens/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styles.dart';

class ScheduleOrder extends StatefulWidget {
  const ScheduleOrder({Key? key}) : super(key: key);

  @override
  _ScheduleOrderState createState() => _ScheduleOrderState();
}

class _ScheduleOrderState extends State<ScheduleOrder> {
  // List of items in our dropdown menu
  List<String> items = ['Cincinatti', 'New York', 'Los Angeles', 'Las Vegas'];
  String dropdownvalue = 'Cincinatti';
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, Function setOrderDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      setOrderDate(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Order>(builder: (context, order, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Schedule order"),
          ),
          body: Consumer<Order>(builder: (context, order, child) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ItemsCounterBar(
                          itemsNumber: order.caulculateTotalOrderItemsNumber()),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme
                                .of(context)
                                .primaryColor,
                            //background color of dropdown button
                            // border: Border.all(color: Colors.black38, width:3), //border of dropdown button
                            borderRadius: BorderRadius.circular(
                                50), //border raiuds of dropdown button
                            // boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                            // BoxShadow(
                            // color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                            // blurRadius: 5) //blur radius of shadow
                            // ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              // Initial Value
                              value: dropdownvalue,

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      items,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;

                                });
                                order.setOrderLocation(newValue!);
                              },

                              icon: Icon(
                                Icons.arrow_circle_down_sharp,
                                size: 40,
                              ),
                              iconEnabledColor: Colors.white,
                              //Icon color
                              style: TextStyle(
                                //te
                                  color: Colors.white, //Font color
                                  fontSize: 20 //font size on dropdown button
                              ),

                              dropdownColor: Theme
                                  .of(context)
                                  .primaryColor,
                              //dropdown background color
                              underline: Container(),
                              //remove underline
                              isExpanded: true, //make true to make width 100%
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: btnStyle,
                              onPressed: () {

                                _selectDate(context,order.setOrderDate);

                          },
                              child: Column(
                                children: [
                                  Text('Delivery Date',
                                      style: TextStyle(
                                        //te
                                          color: Colors.white, //Font color
                                          fontSize:
                                          20 //font size on dropdown button
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "${selectedDate.toLocal()}".split(' ')[0],
                                      style: TextStyle(
                                        //te
                                          color: Colors.white, //Font color
                                          fontSize:
                                          20 //font size on dropdown button
                                      )),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: ElevatedButton(
                              onPressed: () =>
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const OrderSummary()))
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(fontSize: 18),
                              ),
                              style: btnStyle),
                        ),
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
