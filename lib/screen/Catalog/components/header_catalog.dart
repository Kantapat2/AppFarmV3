import 'package:SumApp_1/Constants/constant.dart';
import 'package:SumApp_1/screen/Loadingpage/loading.dart';
import 'package:flutter/material.dart';
import '../home_catalog.dart';
import 'body_catalog.dart';

class CollapsableAppbarDemo extends StatefulWidget {
  CollapsableAppbarDemo() : super();

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
                title: Container(
                  child: Text(
                    'หมวดหมู่',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                )),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, size: 40),
              color: Colors.white,
              tooltip: 'Add new entry',
              onPressed: () =>
                  Navigator.of(context).pop(), //<------ เลือกว่าจะไปหน้าไหน
              // onPressed: () {
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
              pageBuilder: (a, b, c) => CatalogPage(),
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
                return BodyCatalog();
              }
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return nested();
  }
}
