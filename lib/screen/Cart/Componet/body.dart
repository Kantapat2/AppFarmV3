import 'package:SumApp_1/TempData/List_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ItemCart.dart';

class BodyCart extends StatefulWidget {
  _BodyCart createState() => _BodyCart();
}

class _BodyCart extends State<BodyCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
          EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) =>Padding(
            padding:EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
                key: Key(demoCarts[0].product.id.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),                
                    ],
                  )
                ),
                onDismissed: (direction){
                  setState(() {
                    demoCarts.removeAt(index);
                  });
                },
                child: ItemCart(cart: demoCarts[index])
              ),
          ),
        ),
      ),
    );
  }
}

