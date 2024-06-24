import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  static const routeName = "/orderList";
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order List"),
        centerTitle: true,
      ),
    );
  }
}