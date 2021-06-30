import 'package:flutter/material.dart';
import 'package:SumApp_1/Constants/constant.dart';
import 'package:SumApp_1/TempData/Product_list_2.dart';


class BodyCatalog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyCatalog ();
  }
}

class _BodyCatalog  extends State <BodyCatalog > {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
                color: kPrimaryBgColor
                ),
          ),
           Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => Catalog(
                    product: products[index],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class Catalog extends StatelessWidget {
  const Catalog({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final Product2 product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(product.image),
        GestureDetector(
          onTap: press,
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                )
              ],
            ),
            child: Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "${product.title}\n".toUpperCase(),
                      style: Theme.of(context).textTheme.button),
                  TextSpan(
                    text: "${product.description}".toUpperCase(),
                    style: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                  ),
                ])),
                Spacer(),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: kPrimaryColor),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
