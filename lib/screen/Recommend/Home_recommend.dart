import 'package:SumApp_1/screen/Recommend/components/header_recommend.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  @override
  Recommendscreen createState() => Recommendscreen();
}

class Recommendscreen extends State<RecommendPage> {
  String title = '';

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 1),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: SafeArea(child: CollapsableAppbarDemo()),
    );
    return scaffold;
  }
}
