import 'dart:convert';
import 'package:SumApp_1/Constants/constant.dart';
import 'package:SumApp_1/screen/Loadingpage/SomeThingWrong.dart';
import 'package:SumApp_1/screen/Loadingpage/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewContactPage extends StatefulWidget {
  String title = 'NoneTitle',
      head = 'NoneHead', //'ติดต่อซื้อ-ขาย'
      subhead = 'NoneSubhead',
      mypicpath =
          'https://i.pinimg.com/originals/a4/a4/63/a4a463c85c79cea72d39136ce39270d1.png',
          user; //= 'https://i.pinimg.com/originals/a4/a4/63/a4a463c85c79cea72d39136ce39270d1.png'; //'images/mypic2.png';
  // bool extraData = false;
  List<dynamic> metricAsk = standartAsk();
  List<String> listData = standartData();
  Color myBgcolor = kPrimaryBgColor;
  NewContactPage(
      //this.extraData,
      this.user,
      {
      // String title, //@required
       String head,
      // String subhead,
      // String mypicpath,
      // List<dynamic> metricAsk,
      // List<String> listData,
      Color myBgcolor
      }
      ) {
    if (title != null) {
      this.title = title;
    }
    if (head != null) {
      this.head = head;
    }
    if (subhead != null) {
      this.subhead = subhead;
    }
    if (mypicpath != null) {
      this.mypicpath = mypicpath;
    }
    if (metricAsk != null) {
      this.metricAsk = metricAsk;
    }
    if (listData != null) {
      this.listData = listData;
    }
    if (myBgcolor != null) {
      this.myBgcolor = myBgcolor;
    }
  }

// เช็ค null และ ส่งค่า

  //Name construct

  @override
  State<StatefulWidget> createState() {
    return _ContactPage(user,
        title: title,
        head: head,
        mypicpath: mypicpath,
        subHead: subhead,
        metricAsk: metricAsk,
        listData: listData,
        myBgcolor: myBgcolor);
  }
}
List<dynamic> standartAsk() {
  var sAskArray = [];
  var dArray1 = [];
  dArray1.add(Icons.phone);
  dArray1.add('โทร');
  var dArray2 = [];
  dArray2.add(Icons.phone_android);
  dArray2.add('มือถือ');
  var dArray3 = [];
  dArray3.add(Icons.email);
  dArray3.add('E-mail');
  var dArray4 = [];
  dArray4.add(Icons.contacts);
  dArray4.add('Line');

  sAskArray.add(dArray1);
  sAskArray.add(dArray2);
  sAskArray.add(dArray3);
  sAskArray.add(dArray4);

  return sAskArray;
}

List<String> standartData() {
  List<String> sdArray = [];
  sdArray.add('055-968605');
  sdArray.add('081-9997905');
  sdArray.add('bps2018@hotmail.com');
  sdArray.add('@bps2018');

  return sdArray;
  //print(sdArray.runtimeType);
  //print(sdArray[0]);
}

class _ContactPage extends State<NewContactPage> {
  String head, title, mypicpath, subHead;
  Color myBgcolor; //= kPrimaryBgColor; //Color.fromRGBO(222, 184, 135, 1.00);
  List<dynamic> metricAsk; //= standartAsk();
  List<String> listData; //= standartData();
  String user;
  _ContactPage(
    this.user,
    {
    this.title,
    this.head,
    this.mypicpath, 
    this.subHead,
    this.metricAsk,
    this.listData,
    this.myBgcolor,
  }) {
  }

  Map<String, dynamic> mydata;

  @override
  void initState() {
    getmyApi(context);
    super.initState();
  }

  Future<int> getmyApi(BuildContext context) async {
    //String user = 'admin01';
    int statusCode = 0;
    try {
      String url = 'http://188.166.251.25:2000/contact';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"name": "$user"}';
      // get post delete put
      Response response = await post(url, headers: headers, body: json);
      statusCode = response.statusCode;
      mydata = await jsonDecode(response.body);
      //print(mydata);
      //print('statusCode: ${statusCode}\ntemp: '+mydata.toString());
      //print(response.body);
      // Navigator.pushReplacement(context,
      // MaterialPageRoute(builder: (context) => ProductControl())
      // );
    } catch (e) {
      print('Error Found at ${e.toString()}');
      //_showsnackbar(e.toString());
    }

    return statusCode;
  }

  String checkdata(String checkdata) {
    if (checkdata == null) {
      return ' - ';
    }

    return checkdata;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: myTheme,
      home: FutureBuilder<int>(
          future: getmyApi(context), //_calculation,
          builder: (context, snapshot) {
              if (snapshot.data == null) {
                print('Waiting...');
                return LoadingPage();
              } else if (snapshot.data == 200) {
              //print('snapshot.data: ${snapshot.data}');
                subHead = mydata['msg']['store'];
                listData[0] = checkdata(mydata['msg']['phone']);
                listData[1] = checkdata(mydata['msg']['phone2']);
                listData[2] = checkdata(mydata['msg']['email']);
                listData[3] = checkdata(mydata['msg']['line']);
                return _mybody();
              } else {
              return ErrorPage();
            }
          }
      ),
    );
  }

  Widget _mybody() {
    //myBgcolor = Colors.red;
    return Stack(
      children: <Widget>[
        Container(
          decoration:
              new BoxDecoration(color: myBgcolor), //----------- สีพื้นหลัง
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () =>
                  Navigator.of(context).pop(), //<------ เลือกว่าจะไปหน้าไหน
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              head,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child:
                Column(children: <Widget>[_mycard()]),
          ),
        ),
      ],
    );
  }

  Widget _mycard() {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5, // เงา
      margin: EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        margin: EdgeInsets.all(25),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 150,
            width: 250,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              image: new DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: new NetworkImage(mypicpath)), //mydata['msg']['']
            ),
          ), //ใช้สำหรับจำกัดขอบเขตภาพ

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 9.0),
            margin: EdgeInsets.all(3),
            //color: Colors.grey.shade700,
            child: Text(subHead,
                style: TextStyle(fontSize: 25, color: Colors.black),
                textAlign: TextAlign.center),
          ), // <----- ขยายเส้นกั้นให้ ใหญ่ขึ้น

          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                _myitemInrow(
                    icon: metricAsk[0][0],
                    ask: metricAsk[0][1],
                    data: listData[0]),
                _myitemInrow(
                    icon: metricAsk[1][0],
                    ask: metricAsk[1][1],
                    data: listData[1]),
                _myitemInrow(
                    icon: metricAsk[2][0],
                    ask: metricAsk[2][1],
                    data: listData[2]),
                _myitemInrow(
                    icon: metricAsk[3][0],
                    ask: metricAsk[3][1],
                    data: listData[3]),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _myitemInrow({IconData icon, String ask, String data}) {
    return Wrap(
      children: [
        Row(
          children: [
            SizedBox(height: 1, width: 10),
            Icon(
              icon,
              size: 32,
            ),
            SizedBox(height: 1, width: 10),
            Flexible(
              child: Container(

                margin: EdgeInsets.symmetric(
                    vertical:
                        12.0), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text('$ask :  $data',
                            style: TextStyle(
                                height: 1.6, 
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left

                            ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
