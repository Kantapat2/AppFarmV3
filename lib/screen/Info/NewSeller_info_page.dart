import 'dart:ffi';

import 'package:SumApp_1/Constants/constant.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:intl/intl.dart'; // <-- Daeetime format

import 'package:SumApp_1/screen/Contract/New_contact_page.dart';


class NewInfoPageSeller extends StatefulWidget {
  NewInfoPageSeller();
  @override
  State<StatefulWidget> createState() {
    return _NewInfoPageSeller();
  }
}

class _NewInfoPageSeller extends State<NewInfoPageSeller> {
      String mypicpath =
        "https://cdn.igetweb.com/uploads/images-cache/10205/filemanager/3c75718f2632e802d440e4a158cc33f4_full.jpg";
  String nameProduct = 'บริษัท เกษตรก้าวหน้า จำกัด',
  unit='กิโลกรัม';
  String detail =
      'ผลิตจากเนื้อปลาจากชุมชน ที่ผ่านการเลี้ยงด้วยการควบคุม สารอาหาร วัตถุดิบในการทำปั้นสิบมาจากท้องถิ่นผ่านการปรุงแต่งด้วยขั้นตอนที่สะอาด พัฒนาสูตรและบรรจุพภัณฑ์ร่วมกัน ระหว่างมหาวิทยาลัยนเรศวร และกลุ่มแม่บ้านพัฒนาตนเอง อ.เมือง จ.พิษณุโลก';
  int amount = 10, price = 85;
  // [int month = 1, int day = 1, int hour = 0, int minute = 0, int second = 0, int millisecond = 0, int microsecond = 0]
  DateTime date = DateTime.now();
  


//Struck


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo_NewInfo',
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),*/
      theme: myTheme,
      home: Scaffold(
        appBar: null,
        body: SafeArea(child: _mybody()),
        bottomNavigationBar: null,
      ),
    );
  }

  Widget _mybody() {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              color: Colors.yellow.shade50), //----------- สีพื้นหลัง
        ),
        SingleChildScrollView(
          child: Column(children: <Widget>[mypic(), detailField(), myButton()]),
        ),
      ],
    );
  }

  Widget detailField() {

    String formattedDate = DateFormat('d/M/y').format(date);


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
                child: Text('$nameProduct', //<---------หัวเรื่อง
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1,
                      fontSize: 35,
                    )
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(top: 10),
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
                child: Text('$detail', //<---------คำอธิบาย
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 23,
                        color: Colors.grey.shade700)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),
Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(bottom: 10,top: 10),
                child: Text('ปริมาณที่ต้องการ:', //<---------คำอธิบาย
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 25,
                        color: Colors.black)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: Text('\t\t\t\t$amount' + ' $unit' , //<---------คำอธิบาย
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 23,
                        color: Colors.grey.shade700)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),
Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(bottom: 10,top: 10),
                child: Text('กำหนดการส่งมอบ:', //<---------คำอธิบาย
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 25,
                        color: Colors.black)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),
Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: Text('\t\t\t\t$formattedDate'  , //<---------คำอธิบาย
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 23,
                        color: Colors.grey.shade700)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          )





        ],
      ),
    );
  }

  Widget myButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
          onTap: () {
             Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewContactPage(
                        'ErrorHere'//<-------------------------------------------------------------------------ErrorHere
                        //false,
                      //title: 'MyBtnInInfo',
                       //mypicpath :'https://i.pinimg.com/originals/a4/a4/63/a4a463c85c79cea72d39136ce39270d1.png'
                       )
                    ),
                  );
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
              //border: Border.all(width: 3,color: Colors.green,style: BorderStyle.solid),
              color: Colors
                  .yellow.shade800, //<-----------------------------------------
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
              alignment: Alignment.center,
              child: Text('ติดต่อซื้อขาย', //<---------คำอธิบาย
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      fontSize: 30,
                      color: Colors.black)
                  //,overflow: TextOverflow.ellipsis
                  ,
                  textAlign: TextAlign.left),
            ),
          )),
    );
  }

  Widget mypic() {

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            //right: 20,
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
                  bottom: 40,
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
                  image: DecorationImage(
                      fit: BoxFit.fitWidth, image: new NetworkImage(mypicpath)),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ],
          ),
        )
      ],
    );
  }
}
