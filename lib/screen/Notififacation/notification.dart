import 'package:SumApp_1/Constants/constant.dart';
import 'package:flutter/material.dart';

import 'package:SumApp_1/screen/Notififacation/components/Body_noti.dart';
class NotificationPage extends StatefulWidget {
  NotificationPage();
  @override
  State<StatefulWidget> createState() {
    return _NotificationPage();
  }
}

class _NotificationPage extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo_NotificationPage',
      theme: myTheme,
      home: Scaffold(
        appBar: null,
        body: 
        SafeArea(child: Body()),
        bottomNavigationBar: null,
      ),
    );
  }

}
