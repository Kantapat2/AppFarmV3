import 'package:SumApp_1/screen/Loadingpage/loading.dart';
import 'package:flutter/material.dart';
import '../../../Constants/constant.dart';
import '../Cart.dart';
import 'body.dart';

class HeaderCartPage extends StatefulWidget {
  HeaderCartPage() : super();

  final String title = "สินค้าแนะนำ";

  @override
  _HeaderCartPage createState() => _HeaderCartPage();
}

class _HeaderCartPage extends State<HeaderCartPage> {
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
                  'ตะกร้าสินค้า',
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
                  tooltip: 'ย้อนกลับ',
                      onPressed: () =>
                      Navigator.of(context).pop(), //<------ เลือกว่าจะไปหน้าไหน
                ),
            ),
        ];
      },
      body: RefreshIndicator(
        onRefresh: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (a, b, c) => CartPage(),
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
                return BodyCart();
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
