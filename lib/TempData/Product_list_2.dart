class Product2 {
  final String image, title, description;
  final int price;
  Product2({
    this.title,
    this.image,
    this.price,
    this.description,
  });
}

List<Product2> products = [
  Product2(
    title: 'สินค้าแนะนำ 1',
    price: 85,
    description: dummyText1,
    image: 'images/1.png',
  ),
  Product2(
    title: 'สินค้าแนะนำ 2',
    price: 104,
    description: dummyText2,
    image: 'images/1.png',
  ),
  Product2(
    title: 'สินค้าแนะนำ 3',
    price: 200,
    description: dummyText3,
    image: 'images/1.png',
  ),
  Product2(
    title: 'สินค้าแนะนำ 4',
    price: 355,
    description: dummyText4,
    image: 'images/1.png',
  ),
  Product2(
    title: 'สินค้าแนะนำ 5',
    price: 600,
    description: dummyText5,
    image: 'images/1.png',
  ),
  Product2(
    title: 'สินค้าแนะนำ 6',
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
