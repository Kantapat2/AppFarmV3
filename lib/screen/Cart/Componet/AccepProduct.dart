import 'package:SumApp_1/Constants/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AcceptProduct extends StatelessWidget {
  const AcceptProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Colors.white.withOpacity(0.15),
            )
          ]),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"), 
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(text: "Total:\n", children: [
                  TextSpan(
                    text: "\$290",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ])),
                SizedBox(
                  width: 100,
                  child: DefaultButton( 
                    text: "จ่ายเงิน",
                    press: () {
                      
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
