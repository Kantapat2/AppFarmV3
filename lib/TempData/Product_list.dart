import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price;
  final Color color;
  Product({
    this.title,
    this.image,
    this.price,
    this.description,
    this.color,
  });
}

List<Product> products = [
  Product(
    title: 'ปั้นขิมไส้ปลา 1',
    price: 85,
    description: dummyText1,
    image: 'images/1.png',
  ),
  Product(
    title: 'ปั้นขิมไส้ปลา 2',
    price: 104,
    description: dummyText2,
    image: 'images/1.png',
  ),
  Product(
    title: 'ปั้นขิมไส้ปลา 3',
    price: 200,
    description: dummyText3,
    image: 'images/1.png',
  ),
  Product(
    title: 'ปั้นขิมไส้ปลา 4',
    price: 355,
    description: dummyText4,
    image: 'images/1.png',
  ),
  Product(
    title: 'ปั้นขิมไส้ปลา 5',
    price: 600,
    description: dummyText5,
    image: 'images/1.png',
  ),
  Product(
    title: 'ปั้นขิมไส้ปลา 6',
    price: 700,
    description: dummyText6,
    image: 'images/1.png',
  ),
];
String dummyText1 = "สมาคมแม่บ้าน1";
String dummyText2 = "สมาคมแม่บ้าน2";
String dummyText3 = "สมาคมแม่บ้าน3";
String dummyText4 = "สมาคมแม่บ้าน4";
String dummyText5 = "สมาคมแม่บ้าน5";
String dummyText6 = "สมาคมแม่บ้าน6";
