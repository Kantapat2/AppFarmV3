import 'dart:convert';
import 'package:SumApp_1/main.dart';
import 'package:SumApp_1/screen/Home/components/body.dart';
import 'package:SumApp_1/screen/Loadingpage/SomeThingWrong.dart';
import 'package:SumApp_1/screen/Loadingpage/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


//import 'package:flutter_search_bar/flutter_search_bar.dart';
//import 'New_contact_page.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  /*
  String mypicpath =
      "https://cdn.igetweb.com/uploads/images-cache/10205/filemanager/3c75718f2632e802d440e4a158cc33f4_full.jpg";
//Struck

final String title;
final Function press;
 */

//Key _scaffoldkey;

  // Future<String> _calculation = Future<String>.delayed(
  //   Duration(seconds: 1),
  //   () => 'Data Loaded',
  // );

  Map<String, dynamic> mydata;

  @override
  void initState() {
    getmyApi(context);
    super.initState();
  }

  Future<int> getmyApi(BuildContext context) async {
    String user = 'admin01';
    int statusCode = 0;
    try {
      String url = 'http://188.166.251.25:2000/allprodcut';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"id": "$user"}';
      Response response = await post(url, headers: headers, body: json);
      statusCode = response.statusCode;
      mydata = await jsonDecode(response.body);
     print(mydata);
    } catch (e) {
      print('Error Found at ${e.toString()}');
    }

    return statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (a, b, c) => MyApp(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
            return;
          },
          child: FutureBuilder<int>(
              future: getmyApi(context), //_calculation,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  print('Waiting...');
                  return LoadingPage();
                } else if (snapshot.data == 200) {
                  //print('snapshot.data: ${snapshot.data}');
                  return Body(mydata['msg']);
                } else {
                  return ErrorPage();
                  // Center(
                  //   child: Text('Sorry something went Wrong ${snapshot.data}',style: TextStyle(fontSize: 20),),
                  // );
                }
              }
              ),
        ),
      ),
      bottomNavigationBar: null,
    );
  }
}
