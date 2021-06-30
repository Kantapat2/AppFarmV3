import 'package:flutter/material.dart';
import 'package:SumApp_1/Constants/constant.dart';
import 'package:SumApp_1/screen/promotions/components/header_t.dart';

class Promooo extends StatefulWidget {
  @override
  Promoscreen createState() => Promoscreen();
}

class Promoscreen extends State<Promooo> {
 
  String title = 'โปรโมชั่น';
  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 1),
    () => 'Data Loaded',
  );


  @override
  Widget build(BuildContext context) {
    var scaffold = 
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo_NewPromo',
      theme: myTheme,
      home: 
    Scaffold(

        body: SafeArea(
          child: CollapsableAppbarDemo()
        ),
    ),
        );
    return scaffold;
  }
}
