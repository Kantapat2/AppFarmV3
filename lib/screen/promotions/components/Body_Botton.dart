import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:SumApp_1/Constants/constant.dart';

class Buttonss extends StatelessWidget {
  
  int countlist = 4;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: new BoxDecoration(
              color: kPrimaryBgColor),
        ),



        SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: <Widget>[
              Container(height:10,width: 10,
              ),  

              if(countlist !=0)...[
              for(int i=0;i<=countlist;i++)
              Buttons(
                image: "images/Ex_pro.jpg",
                title:
                    "ปั้นสิบไส้ปลา ซื้อครบ 10 ชิ้น ลด 10%",
                press: (){print('XD');},
              ),

              ]
              else...
              [
                Container(
                  height: MediaQuery.of(context).size.height*0.8,
                  //color: Colors.teal,
                  child: Center(
                    child: Text('กิจกรรมจะจัดในเร็วๆนี้',style: TextStyle(fontSize: 25)),
                  ),
                )
              ]
            ],
          ),
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    Key key,
    this.image,
    this.title,
    this.press,
  }) : super(key: key);
  final String image, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
      height: 150,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 0,
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Colors.black.withOpacity(0.20)),
        ],
      ),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: press,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 140,
                child: AutoSizeText(
                  '$title',
                  style: TextStyle(
                    height: 1.6,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
