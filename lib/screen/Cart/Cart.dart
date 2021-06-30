import 'package:flutter/material.dart';
import 'Componet/AccepProduct.dart';
import 'Componet/header.dart';

class CartPage extends StatefulWidget {
  CartPage();
  @override
  State<StatefulWidget> createState() {
    return _CartPage();
  }
}

class _CartPage extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: HeaderCartPage(),
        
      ),
      bottomNavigationBar: AcceptProduct(),
    );
  }
}
