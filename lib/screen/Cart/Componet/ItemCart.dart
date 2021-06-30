import 'package:SumApp_1/TempData/List_cart.dart';
import 'package:flutter/material.dart';
import '../../../Constants/constant.dart';
import 'counter_cart.dart';


class ItemCart extends StatelessWidget {
  const ItemCart({
    Key key, 
    this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Text(
                demoCarts[0].product.title,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(
              text: "\$${cart.product.price}",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
              )
            ),
            CartCounter(),
          ],
        )
      ],
    );
  }
}
