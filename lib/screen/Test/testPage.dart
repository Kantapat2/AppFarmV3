import 'package:SumApp_1/screen/Cart/Cart.dart';
import 'package:SumApp_1/screen/Info/components/Gps.dart';
import 'package:flutter/material.dart';
/*
import 'package:sampleproject/NewBuyer_info_page.dart';

import './contact_page.dart';
import './info_page.dart';
import './test_search.dart';
import './userBuyPage.dart';
import './videoplayTest.dart';
import './New_contact_page.dart';
import './NewSeller_info_page.dart';
*/
import 'package:SumApp_1/screen/Info/NewSeller_info_page.dart';
import 'package:SumApp_1/screen/Contract/New_contact_page.dart';
import 'package:SumApp_1/screen/Info/NewBuyer_info_page.dart';

class TestPage extends StatefulWidget {
  TestPage();

  @override
  State<StatefulWidget> createState() {
    return _TestPage();
  }
}

List<dynamic> standartDataAsk({List<IconData> icon, List<String> ask}) {
  var sdArray = [];

  var dArray1 = [];
  dArray1.add(icon[0]);
  dArray1.add(ask[0]);
  var dArray2 = [];
  dArray2.add(icon[1]);
  dArray2.add(ask[1]);
  var dArray3 = [];
  dArray3.add(icon[2]);
  dArray3.add(ask[2]);
  var dArray4 = [];
  dArray4.add(icon[3]);
  dArray4.add(ask[3]);

  sdArray.add(dArray1);
  sdArray.add(dArray2);
  sdArray.add(dArray3);
  sdArray.add(dArray4);

  return sdArray;
  //print(sdArray.runtimeType);
  //print(sdArray[0]);
}

// List<String> standartData(List<String> data)
// {
//   var listData =[];
//   listData.add(data[0]);
//   listData.add(data[1]);
//   listData.add(data[2]);
//   listData.add(data[3]);
//   return listData;

// }

class _TestPage extends State<TestPage> {
  //List<dynamic> metricDataContact = standartDataContact();

  // Map<String, dynamic> mydata;

  // @override
  // void initState() {
  //   getmyApi(context);
  //   super.initState();
  // }

  // Future<int> getmyApi(BuildContext context) async {
  //   String user = 'admin01';
  //   String seller ='myseller01';
  //   String product ='ปั้นสิบ';
  //   int pice = 50;
  //   int statusCode = 0;
  //   try {
  //     String url = '';//'http://188.166.251.25:2000/addorder';
  //     Map<String, String> headers = {"Content-type": "application/json"};
  //     String json = '{"buyer": $user, "seller": $seller, "product": $product, "pice": $pice}';
  //     // get post delete put
  //     Response response = await post(url, headers: headers, body: json);
  //     statusCode = response.statusCode;
  //     mydata = await jsonDecode(response.body);
  //     // print(id);
  //     //print('statusCode: ${statusCode}\ntemp: '+temp.toString());
  //     //print(response.body);
  //     // Navigator.pushReplacement(context,
  //     // MaterialPageRoute(builder: (context) => ProductControl())
  //     // );
  //   } catch (e) {
  //     print('Error Found at ${e.toString()}');
  //     //_showsnackbar(e.toString());
  //   }

  //   return statusCode;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo_NewInfo',
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),*/
      home: Scaffold(
        //appBar: null,
        body: SafeArea(child: myContent()),
        bottomNavigationBar: null,
      ),
    );
  }

  Widget myContent() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/tempbg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.8,
          color: Colors.cyan.withOpacity(0.3),
          margin: EdgeInsets.symmetric(vertical: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //mycard(),mycard(),mycard(),mycard(),mycard(),mycard(),mycard(),mycard(),mycard(),mycard(),
                RaisedButton(
                  onPressed: () {
                    // <-----------  ใช้สำหรับ ทดสอบ
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewInfoPageSeller()),
                    );
                    print('tab Me');
                  },
                  child: Text('Press me for InfoPageSeller'),
                ),
                RaisedButton(
                  onPressed: () {
                    // <-----------  ใช้สำหรับ ทดสอบ
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewInfoPageBuyer(
                              'Error_Here') // <-----------Error Here
                          ),
                    );
                    print('tab Me');
                  },
                  child: Text('Press me for InfoPageBuyer'),
                ),
                RaisedButton(
                  onPressed: () {
                    // <-----------  ใช้สำหรับ ทดสอบ
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewContactPage(
                                'ErrorHere', // <---------------------------------------ErrorHere
                                //true,
                                // title: 'XD1',
                                //mypicpath: 'https://i1.wp.com/googleanalyticsthailand.com/wp-content/uploads/2020/05/Line-my-shop.png?resize=768%2C377&ssl=1',
                                myBgcolor: Colors.yellow.shade100,
                              )),
                    );
                    print('tab Me');
                  },
                  child: Text('Press me for ContactPageSomeSet'),
                ),
                RaisedButton(
                  onPressed: () {
                    // <-----------  ใช้สำหรับ ทดสอบ
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewContactPage(
                          'ErrorHere', // <---------------------------------------ErrorHere
                          //true,
                          myBgcolor: Colors.green.shade100,
                          // title: 'mytitle4',
                          // head: 'ติดต่อซื้อ-ขาย',
                          // subhead: 'กลุ่มแม่บ้านพัฒนาตนเอง อ.เมือง จ.พิษณุโลก',
                          // mypicpath: 'https://i1.wp.com/googleanalyticsthailand.com/wp-content/uploads/2020/05/Line-my-shop.png?resize=768%2C377&ssl=1',
                          // metricAsk: standartDataAsk(
                          //   icon: [
                          //     Icons.phone,
                          //     Icons.phone_android,
                          //     Icons.email,
                          //     Icons.contacts
                          //   ],
                          //   ask: ['โทร', 'มือถือ', 'E-mail', 'Line'],
                          // ),
                          // listData: ['1','2','3','4'],
                        ),
                      ),
                    );
                    print('tab Me');
                  },
                  child: Text('Press me for ContactPage_Custom'),
                ),
                RaisedButton(
                  onPressed: () {
                    // <-----------  ใช้สำหรับ ทดสอบ
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewContactPage(
                                'ErrorHere', // <---------------------------------------ErrorHere
                                //true,
                                // title: 'XD15',
                                //mypicpath: 'https://i1.wp.com/googleanalyticsthailand.com/wp-content/uploads/2020/05/Line-my-shop.png?resize=768%2C377&ssl=1',
                                myBgcolor: Colors.yellow.shade100,
                              )),
                    );
                    print('tab Me');
                  },
                  child: Text('Press me for ContactPageSomeSet'),
                ),
                // RaisedButton(
                //   onPressed: () {
                //     // <-----------  ใช้สำหรับ ทดสอบ
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //     builder: (context) =>ErrorPage()
                //     //   ),
                //     // );
                //     print('mydata:\n' + mydata.toString());
                //     for (int i=0;i<= mydata.length;i++)
                //     {
                //       print('\n\nmsg[$i]:\n' + mydata['msg'][i].toString());
                //     }
                //     //print('\n\nmsg:\n' + mydata['msg'].toString());
                //   },
                //   child: Text('Check Data'),
                // ),

                RaisedButton(
                  onPressed: () {
                    // <-----------  ใช้สำหรับ ทดสอบ
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Map()),
                    );
                    print('tab Me');
                  },
                  child: Text('Press me for Map'),
                ),

                RaisedButton(
                  onPressed: () {
                    // <-----------  ใช้สำหรับ ทดสอบ
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                    print('tab Me');
                  },
                  child: Text('Press me for CartPage'),
                ),
                

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mycard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5, // เงา
      margin: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '|USERNAME',
            icon: Icon(Icons.email)),
      ),
    );
  }
}
