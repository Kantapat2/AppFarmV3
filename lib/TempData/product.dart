import 'package:flutter/material.dart';

class Product_cart {
  final int id;
  final String title;
  final List<String> images;
  final double price;
  final int count;

  Product_cart({
   @required this.id,
   @required this.images,
   @required this.title,
   @required this.price,
   @required this.count,
  });
}

List<Product_cart> demoProducts = [
  Product_cart(
    id: 1,
    images: [
      "assets/images/Item1.png",
    ],
    title: "ผักละผลไม้1",
    price: 60,
    count: 1,
  ),
  Product_cart(
    id: 2,
    images: [
      "assets/images/Item3.png",
    ],
    title: "ผักละผลไม้2",
    price: 50,
    count: 1,
  ),
  Product_cart(
    id: 3,
    images: [
      "assets/images/Item6.png",
    ],
    title: "ผักละผลไม้3",
    price: 40,
    count: 1,
  ),
  Product_cart(
    id: 4,
    images: [ 
      "assets/images/Item4.png",
    ],
    title: "ผักละผลไม้4",
    price: 20,
    count: 1,
  ),
  Product_cart(
    id: 5,
    images: [
      "assets/images/Item5.png",
    ],
    title: "ผักละผลไม้",
    price: 100,
    count: 1,
  ),
  Product_cart(
    id: 6,
    images: [
      "assets/images/Item6.png",
    ],
    title: "Nike Sport White - Man Pant",
    price: 50,
    count: 1,
  ),
  Product_cart(
    id: 7,
    images: [
      "assets/images/Item1.png",
    ],
    title: "ผักละผลไม้",
    price: 30,
    count: 1,
  ),
  Product_cart(
    id: 8,
    images: [
      "assets/images/Item3.png",
    ],
    title: "ผักละผลไม้",
    price: 40,
    count: 1,
  ),
];
