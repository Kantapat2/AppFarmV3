import 'package:SumApp_1/Constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      ignoringSemantics: true,
          child: Container(
        color: kPrimaryBgColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
