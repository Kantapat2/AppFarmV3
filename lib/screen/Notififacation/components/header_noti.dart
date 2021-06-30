import 'package:flutter/material.dart';
//import 'package:SumApp_1/screen/Home/constants.dart';

import 'package:SumApp_1/Constants/constant.dart';

class HeaderNotification extends StatelessWidget {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: size.height * 0.2 - 20,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.2 - 20,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 50, right: 50, top: 25, bottom: 0),
                    child: Center(
                      child: Text(
                        'แจ้งเตือน',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white, fontSize: 45),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
