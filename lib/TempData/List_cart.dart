import 'package:flutter/cupertino.dart';

import 'Product.dart';


class Cart {
  final Product_cart product;
  final int numofItem;

  Cart({ @required this.numofItem, @required this.product});
}

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numofItem: null),
  Cart(product: demoProducts[1], numofItem: null),
  Cart(product: demoProducts[3], numofItem: null),
  Cart(product: demoProducts[4], numofItem: null),
  Cart(product: demoProducts[5], numofItem: null),
  Cart(product: demoProducts[6], numofItem: null),
];
