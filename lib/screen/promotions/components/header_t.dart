import 'package:SumApp_1/Constants/constant.dart';
import 'package:SumApp_1/screen/Loadingpage/loading.dart';
import 'package:SumApp_1/screen/promotions/promo_screen.dart';
import 'package:flutter/material.dart';
import 'package:SumApp_1/screen/promotions/components/Body_Botton.dart';

class CollapsableAppbarDemo extends StatefulWidget {
  CollapsableAppbarDemo() : super();

  final String title = "โปรโมชั่น";

  @override
  _CollapsableAppbarDemoState createState() => _CollapsableAppbarDemoState();
}

class _CollapsableAppbarDemoState extends State<CollapsableAppbarDemo> {

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 1),
    () => 'Data Loaded',
  );



  nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: kPrimaryColor,
            expandedHeight: 70.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'โปรโมชั่น',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
        ];
      },
      body: 
      RefreshIndicator(
            onRefresh: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (a, b, c) => Promooo(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
              return _calculation;
            },
            child: FutureBuilder<String>(
                future: _calculation,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return LoadingPage();   
                  } else {
                    return Buttonss();
                  }
                }
                ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: nested(),
    );
  }
}
