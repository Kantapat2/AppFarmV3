import 'package:SumApp_1/screen/Catalog/components/header_catalog.dart';
import 'package:flutter/material.dart';


class CatalogPage extends StatefulWidget {
  @override
  Catalogscreen createState() => Catalogscreen();
}

class Catalogscreen extends State<CatalogPage> {
  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 1),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    var scaffold = 
    Scaffold(
        body: SafeArea(
          child: CollapsableAppbarDemo()
        ),
    );
    return scaffold;
  }
}
