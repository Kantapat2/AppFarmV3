import 'package:SumApp_1/Constants/constant.dart';
import 'package:SumApp_1/screen/Loadingpage/loading.dart';
import 'package:SumApp_1/screen/Recommend/components/%E0%B8%BA%E0%B8%BABody_recommend.dart';
import 'package:SumApp_1/screen/Recommend/Home_recommend.dart';
import 'package:flutter/material.dart';

class CollapsableAppbarDemo extends StatefulWidget {
  CollapsableAppbarDemo() : super();

  final String title = "สินค้าแนะนำ";

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
                  'สินค้าแนะนำ',
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
              leading : IconButton(
                  icon: const Icon(Icons.arrow_back, size: 40),
                  color: Colors.white,
                  tooltip: 'Add new entry',
                      onPressed: () =>
                      Navigator.of(context).pop(), //<------ เลือกว่าจะไปหน้าไหน
              //     onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => HomePage()),
              //   );
              // },
                ),
            ),
        ];
      },
      body: RefreshIndicator(
        onRefresh: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (a, b, c) => RecommendPage(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
          return;
        },
        child: FutureBuilder<String>(
            future: _calculation,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return LoadingPage();
              } else {
                return Body2();
              }
            }),
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
