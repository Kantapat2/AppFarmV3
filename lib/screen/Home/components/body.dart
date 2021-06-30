import 'package:flutter/material.dart';

import './Header.dart';
import './Recommend.dart';
import './Catalog.dart'; 

import 'package:SumApp_1/Constants/constant.dart';

class Body extends StatelessWidget {
  List<dynamic> mydata;
  Body(this.mydata);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              color: kPrimaryBgColor), //----------- สีพื้นหลัง
        ),
        //SingleChildScrollView(
          ListView(
             physics: const AlwaysScrollableScrollPhysics(),
          children: [ Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Header(), Catalog(), Recommend(mydata)],
          ),
      ]
        ),
      ],
    );
  }






















  
}
