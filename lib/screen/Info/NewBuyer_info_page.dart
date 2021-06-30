import 'dart:convert';
import 'package:SumApp_1/Constants/constant.dart';
import 'package:SumApp_1/screen/Info/components/VideoApp.dart';
import 'package:SumApp_1/screen/Loadingpage/SomeThingWrong.dart';
import 'package:SumApp_1/screen/Loadingpage/loading.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_search_bar/flutter_search_bar.dart';

import 'package:SumApp_1/screen/Contract/New_contact_page.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:SumApp_1/screen/Info/components/popup.dart';

class NewInfoPageBuyer extends StatefulWidget {
  String nameProduct = 'myproduct';
  NewInfoPageBuyer(this.nameProduct);
  @override
  State<StatefulWidget> createState() {
    return _NewInfoPageBuyer(nameProduct);
  }
}

class _NewInfoPageBuyer extends State<NewInfoPageBuyer> {
  
  String nameProduct = 'ปั้นสิบไส้ปลา';
  String byPeople = 'กลุ่มแม่บ้านพัฒนาตนเอง';
  String byAt = 'อ.เมือง จ.พิษณุโลก';
  String detail =
      'ผลิตจากเนื้อปลาจากชุมชน ที่ผ่านการเลี้ยงด้วยการควบคุม สารอาหาร วัตถุดิบในการทำปั้นสิบมาจากท้องถิ่นผ่านการปรุงแต่งด้วยขั้นตอนที่สะอาด พัฒนาสูตรและบรรจุพภัณฑ์ร่วมกัน ระหว่างมหาวิทยาลัยนเรศวร และกลุ่มแม่บ้านพัฒนาตนเอง อ.เมือง จ.พิษณุโลก';
  double rate = 5.0;
  int amount = 10, price = 85;

  String myurl ='https://www.youtube.com/watch?v=3SEhUVLRhIg';
  Size size;
  Map<String, dynamic> mydata;

  _NewInfoPageBuyer(this.nameProduct);
//Struck

  @override
  void initState() {
    getmyApi(context);
    super.initState();
  }

  Future<int> getmyApi(BuildContext context) async {
    //String name = 'ขนมปั้นสิบ';
    int statusCode = 0;
    try {
      String url = 'http://188.166.251.25:2000/oneproduct';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"name": "$nameProduct"}';
      // get post delete put
      Response response = await post(url, headers: headers, body: json);
      statusCode = response.statusCode;
      mydata = await jsonDecode(response.body);
      //print('statusCode: ${statusCode}\ntemp: '+mydata.toString());
      //print(response.body);
      // Navigator.pushReplacement(context,
      // MaterialPageRoute(builder: (context) => ProductControl())
      // );
    } catch (e) {
      print('Error Found at ${e.toString()}');
    }

    return statusCode;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo_NewฺBuyerInfo',
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),*/
      //theme: myTheme,
      home: Scaffold(
        //appBar: null,
        body: SafeArea(
            child: FutureBuilder<int>(
                future: getmyApi(context), //_calculation,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    print('Waiting...');
                    return LoadingPage();
                  } else if (snapshot.data == 200) {
                    //print('snapshot.data: ${snapshot.data}');
                    //print(mydata['msg']);
                    return _mybody();
                  } else {
                    return ErrorPage();
                  }
                })

            //child: Body()
            ),

        //child: _mybody()),
        //bottomNavigationBar: null,
      ),
    );
  }

  Widget _mybody() {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              color:
                  kPrimaryBgColor //Colors.green.shade50 //----------- สีพื้นหลัง
              ),
        ),
        SingleChildScrollView(
          child:
              Column(children: <Widget>[header(), detailField(), myButton()]),
        ),
      ],
    );
  }

  Widget detailField() {
    return Container(
      margin: EdgeInsets.all(20),
      //color: Colors.red,
      child: Column(
        children: <Widget>[
//<---- หัวเรื่อง
          Align(
            //<----------------------------   ทำให้ตัวอักษร เริ่ม ด้านซ้าย
            alignment: Alignment.centerLeft,
            child: Container(
                child: Text('${mydata['msg']['name']}', //<---------หัวเรื่อง//nameProduct
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1,
                      fontSize: 35,
                    )
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),
// <--- แหล่งที่มา
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                child: Text('$byPeople' + ' $byAt', //<---------คำอธิบาย // --------------------ขาด
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 20,
                        color: Colors.grey.shade700)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text('รายละเอียด:', //<---------คำอธิบาย
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 25,
                        color: Colors.black)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),
          //<---- เนื้อเรื่อง
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: Text('${mydata['msg']['detail']}', //<---------คำอธิบาย //detail
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 23,
                        color: Colors.grey.shade700)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),
        ],
      ),
    );
  }

  Widget myButton() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          GestureDetector(
            onTap: () {
              // <-----------  ใช้สำหรับ ทดสอบ
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => NewContactPage(
              //           //true,
              //           title: 'XD1',
              //           head: 'ติดต่อซื้อ-ขาย',
              //           subhead: 'กลุ่มแม่บ้านพัฒนาตนเอง',
              //           //mypicpath: 'https://i1.wp.com/googleanalyticsthailand.com/wp-content/uploads/2020/05/Line-my-shop.png?resize=768%2C377&ssl=1',
              //           myBgcolor: kPrimaryBgColor //Colors.green.shade100,
              //           )),
              // );
              //String user, String seller, String product, int pice
              //<---------- เชื่อม Api9i'ouh
              String user ='User01';
              if (sendOrder('${user}','${mydata['msg']['id']}','${mydata['msg']['name']}','${mydata['msg']['pice']}') == 200)
              {
                  print('pass');
              }
              print('Add to shoping cart');
            },
            child: Container(
              height: size.height * 0.12,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                //border: Border.all(width: 3,color: Colors.green,style: BorderStyle.solid),
                color: Colors.green
                    .shade900, //<-----------------------------------------
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.1),
                  child: Icon(
                    Icons.add,//Icons.shopping_cart,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              // <-----------  ใช้สำหรับ ทดสอบ
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewContactPage(
                      mydata['msg']['id'],
                        //true,
                        // title: 'XD1',
                         head: 'ติดต่อซื้อ-ขาย',
                        // subhead: 'กลุ่มแม่บ้านพัฒนาตนเอง',
                        //mypicpath: 'https://i1.wp.com/googleanalyticsthailand.com/wp-content/uploads/2020/05/Line-my-shop.png?resize=768%2C377&ssl=1',
                        myBgcolor: kPrimaryBgColor //Colors.green.shade100,
                        )),
              );
              print('tab Me');
            },
            /*onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewContactPage(
                            false,
                            title: 'XDD',
                          )),
                );
              },*/
            child: Container(
              height: size.height * 0.1,
              width: size.width * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                //border: Border.all(width: 3,color: Colors.green,style: BorderStyle.solid),
                color: Colors.green
                    .shade800, //<-----------------------------------------
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey.withOpacity(0.5),
                  //   spreadRadius: 5,
                  //   blurRadius: 7,
                  //   offset: Offset(0, 3), // changes position of shadow
                  // ),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text('ติดต่อซื้อขาย', //<---------คำอธิบาย
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 30,
                        color: Colors.white)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left),
              ),
            ),
          )

          //Container(color: Colors.red, height: 10, width: 5)
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mypic(mydata['msg']['pic']),
        option([ //<-------------------------------------------- Edit Here
          mydata['msg']['pic'],
          mydata['msg']['pic'], //<-------------------------------------------- Edit Here
          mydata['msg']['pic'], //<-------------------------------------------- Edit Here
          mydata['msg']['pice'],
          mydata['msg']['price']
        ])
      ],
    );
  }

  Widget option(List<dynamic> myoptiondata) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              //<------ ดาว
              children: [
                Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 50,
                ),
                Text(
                  'x${rate.toStringAsFixed(1)}', //myoptiondata[0].toStringAsFixed(1)
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
              top: 10,
              left: 20,
            ),
            child: IconButton(
              icon: Icon(Icons.ondemand_video, size: 50),
              color: Colors.black,
              onPressed: () {
                _launchInWebViewOrVC(myurl);
                //_showDialog(); //myoptiondata[1]

                //print('You press Me[ondemand_video]');
                //<---------------  เชื่อมไป หน้า ถัดไป  //Navigator.push( context, MaterialPageRoute(builder: (context) => InfoPage())
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
              top: 10,
              left: 20,
            ),
            child: IconButton(
              icon: Icon(Icons.location_on, size: 50),
              color: Colors.black,
              onPressed: () {
                //_launchInWebViewOrVC(myurl);
                _showDialogUnFin(); //myoptiondata[2]
                //print('You press Me[location_on]');
                //<---------------  เชื่อมไป หน้า ถัดไป  //Navigator.push( context, MaterialPageRoute(builder: (context) => InfoPage())
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(text: 'จำนวน:\n'),
                  new TextSpan(
                      text: '${myoptiondata[3]} ชิ้น', //myoptiondata[3]//amount
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(text: 'ราคา:\n'),
                  new TextSpan(
                      text: '${myoptiondata[4]} บาท', //myoptiondata[4]//price
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          //title: Text('Video'),
          child: Container(
              //color: Colors.blue,
              margin: EdgeInsets.all(10),
              //color: Colors.blue,
              height: size.height * 0.45,
              //width: size.width ,
              child: Column(
                children: [
                  //url google api แล้ว
                  VideoApp(
                      urlVDO:
                          'https://www.googleapis.com/drive/v3/files/1cK-mzWpP7RpNR5_IxXNVxG9uLPckS8ty?alt=media&key=AIzaSyDjHf22OPoHbDAKetPVFotq5z7qU6yBdhM'), //'https://drive.google.com/uc?export=download&id=1sZCQb9hXw2hqvn7CGclXKbolpr5ra_Bi'),
                  Spacer(),
                  Align(
                    //alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: FlatButton(
                            //color: Colors.red,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'ออก',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        //SizedBox(width: 5,)
                      ],
                    ),
                  )
                ],
              ) //Text('Video Here') //VideoApp()
              ),
          /* SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          */
        );
      },
    );
  }

  void _showDialogUnFin() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          //title: Text('Video'),
          child: Container(
              //color: Colors.blue,
              margin: EdgeInsets.all(10),
              //color: Colors.blue,
              height: size.height * 0.2,
              //width: size.width ,
              child: Column(
                children: [
                  //url google api แล้ว
                  Container(
                      //margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                      ),
                      child: Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            'กิจกรรมนี้จะจัดเร็วๆนี้',
                            style: TextStyle(fontSize: 30),
                          ))),
                  Spacer(),
                  Align(
                    //alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: FlatButton(
                            //color: Colors.red,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'ออก',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        //SizedBox(width: 5,)
                      ],
                    ),
                  )
                ],
              ) //Text('Video Here') //VideoApp()
              ),
        );
      },
    );
  }

  Widget mypic(String mypicpath) {
    // String mypicpath =
    //     "https://cdn.igetweb.com/uploads/images-cache/10205/filemanager/3c75718f2632e802d440e4a158cc33f4_full.jpg";

    return Column(
      children: [
        Container(
          height: size.height * 0.5,
          width: size.width * 0.65,
          margin: EdgeInsets.only(
            right: 20,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
            //border: Border.all(width: 3,color: Colors.green,style: BorderStyle.solid),
            color: Colors.white70, //<-----------------------------------------
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 5,
                  bottom: size.height * 0.04, //40,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 50,
                  ) //<--------- ปุ่ม ค้นหา เอา ออก ???
                  ,
                  onPressed: () =>
                      Navigator.of(context).pop(), //<------ เลือกว่าจะไปหน้าไหน
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 45,
                  top: 0,
                  right: 30,
                  bottom: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  // image: DecorationImage(
                  //     fit: BoxFit.fitWidth, image: new NetworkImage(mypicpath)),
                ),
                height: size.height * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    '$mypicpath',
                    width: size.width * 0.5,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
  
    Future<void> _launchInWebViewOrVC(String url) async {
    //<------ ต้องรัน flutter pub get ก่อนใน cmd ถึงจะ รันได้
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<int> sendOrder(
    String user,
    String seller,
    String product,
    String pice
  ) async {
   /*user = 'admin01';
   seller ='myseller01';
   product ='ปั้นสิบ';
   pice = 50;*/
    int statusCode = 0;
    try {
      String url = 'http://188.166.251.25:2000/addorder';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"buyer": $user, "seller": $seller, "product": $product, "pice": $pice}';
      // get post delete put
      Response response = await post(url, headers: headers, body: json);
      statusCode = response.statusCode;
      mydata = await jsonDecode(response.body);
      // print(id);
      //print('statusCode: ${statusCode}\ntemp: '+temp.toString());
      print(response.body);
      // Navigator.pushReplacement(context,
      // MaterialPageRoute(builder: (context) => ProductControl())
      // );
    } catch (e) {
      print('Error Found at ${e.toString()}');
      //_showsnackbar(e.toString());
    }
    print(statusCode);
    return statusCode;
  }
}
