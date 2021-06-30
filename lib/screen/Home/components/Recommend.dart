import 'package:SumApp_1/screen/Info/NewBuyer_info_page.dart';
import 'package:SumApp_1/screen/Recommend/Home_recommend.dart';
import 'package:flutter/material.dart';
//import 'package:SumApp_1/screen/Home/constants.dart';

import 'package:SumApp_1/Constants/constant.dart';

// ดึงค่าจาก list มาใช้ เฉยๆ

import 'package:SumApp_1/screen/Test/tempData.dart';
import 'package:SumApp_1/screen/Test/tempDataClass.dart';

class Recommend extends StatelessWidget {
  List<dynamic> mydata = [];
  Recommend(this.mydata);
  Size size;
  BuildContext context;
  @override
  Widget build(BuildContext _context) {
    context = _context;
    size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          bottom:
              20), // padding คือ การขยายตัวเอง margin คือการขยายพื้นที่แต่ไม่ขยายตัวเอง
      //color: Colors.grey,
      width: size.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                //color: Colors.red,
                //height: 30,
                margin: EdgeInsets.only(top: 10, left: 20, bottom: 15),
                child: Text(
                  "สินค้าแนะนำ",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecommendPage()),
                      );

                      print('yor want more?');
                    },
                    child: Text(
                      "เพิ่มเติม",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: kPrimaryColor),
              )
            ],
          ),
          itemsInRecommend()
        ],
      ),
    );
  }

  Widget itemsInRecommend() {
    //print('XDD    01');
    //TempData td = TempData();

    //td.mylistData();
    //print(td.mylistData()[0]);
    //print(td.mylistData()[0]['namePro']);
    //print(mydata[0]);
    return Container(
      height: size.height * 0.4, //size.height * 0.45,
      //padding: EdgeInsets.symmetric(vertical: 10),
      //color: Colors.red,
      child: ListView.builder(
        //physics: ClampingScrollPhysics(),
        //shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: mydata.length, //td.mylistData().length, //15,
        itemBuilder: (BuildContext context, int index) => itemInRecommend(
            namePro: mydata[index]['name'], //td.mylistData()[index]['namePro'],
            price: mydata[index]['price'], //td.mylistData()[index]['price'],
            at: mydata[index]['detail'], //td.mylistData()[index]['at'],
            mypicpath: mydata[index]['pic'],
            press: NewInfoPageBuyer(mydata[index]['name'])),
      ),
    );
  }

  Widget itemInRecommend({
    String mypicpath =
        'https://th-test-11.slatic.net/p/4273727815646c76b0fb007fc0989feb.jpg_720x720q80.jpg_.webp', //'images/defau_img.jpg',
    String namePro = 'ปั้นสิบไส้ปลา',
    String price = '85',
    String at = 'กลุ่ม แม่บ้าน พัฒนาตนเอง',
    NewInfoPageBuyer press, // Function
  }) {

    return Container(

      alignment: Alignment.topCenter,
      width: size.width * 0.45,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5, // เงา
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(55.0), //20
          side: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                //color: Colors.red,
                height: size.height * 0.15,

                //width: size.width * 0.3,
                child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.all(Radius.circular(100)),
// //                     image: new DecorationImage(
// //                       image: NetworkImage('$mypicpath',//NetworkImage
// // ),//ExactAssetImage('$mypicpath'), // NetworkImage(url)
// //                       fit: BoxFit.cover,
// //                     ),
//                     //image: Image.asset('$mypicpath'),
//                   ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: 
                    //Image.asset('images/defau_img.jpg')
                    Image.network(
                      '$mypicpath',//'https://www.beartai.com/wp-content/uploads/2018/03/Made.in_.Abyss_.full_.2184831.jpg',//
                      width: size.width * 0.5,
                      fit: BoxFit.fill,
                      // loadingBuilder: (BuildContext context, Widget child,
                      //     ImageChunkEvent loadingProgress) {
                      //   if (loadingProgress == null) return child;
                      //   return Center(
                      //     child: CircularProgressIndicator(
                      //       value: loadingProgress.expectedTotalBytes != null
                      //           ? loadingProgress.cumulativeBytesLoaded /
                      //               loadingProgress.expectedTotalBytes
                      //           : null,
                      //     ),
                      //   );
                      // },
                    ),
                  ),
                  margin: EdgeInsets.all(3),
                  //child: Image.asset('$mypicpath')
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    //color: Colors.red,
                    width: size.width * 0.25,
                    child: Text(
                      '$namePro',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: TextStyle(
                      color: Colors.green.shade900,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$at',
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 13,
                  ),
                ),
              ),
              Spacer(),
              OutlineButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => press),
                    );
                  },
                  child: Text(
                    "เพิ่มเติม",
                    style: TextStyle(color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.white)
            ],
          ),
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color:
                    ktriColor,
                spreadRadius: 10,
                blurRadius: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
