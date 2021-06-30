import 'package:SumApp_1/screen/Loadingpage/loading.dart';
import 'package:flutter/material.dart';
import 'package:SumApp_1/Constants/constant.dart';
import '../notification.dart';
import 'mycard_noti.dart';
class Body extends StatelessWidget {

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 1),
    () => 'Data Loaded',
  );


  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return nested(context);
  }


  Widget nested(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      headerSliverBuilder: (BuildContext context, bool innerBoIsScrolled) {
        return <Widget>[
          SliverAppBar(
            //toolbarHeight :200,
            backgroundColor: kPrimaryColor,
            expandedHeight: 70.0,//150
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'แจ้งเตือน',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
        
      ),
    ),
          ),
        ];
      },//Container(height:10,width: 10,color: Colors.red,) 
      body:Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              color: kPrimaryBgColor), //----------- สีพื้นหลัง
        ),


        RefreshIndicator(
            onRefresh: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (a, b, c) => NotificationPage(),
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
                    return mydata();
                  }
                }

                //child: Body()
                ),
          ),
      ],
    )
    );
  }


Widget mydata()
{
  return SingleChildScrollView(
           physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(           
            children: <Widget>[
              Container(height:10,width: 10,
              ),
                  MyCard(onlinepic: true,
                  onlinePicPath: 'https://www.smeleader.com/wp-content/uploads/2019/04/%E0%B8%88%E0%B8%B1%E0%B8%94%E0%B9%82%E0%B8%9B%E0%B8%A3%E0%B9%82%E0%B8%A1%E0%B8%8A%E0%B8%B1%E0%B9%88%E0%B8%99%E0%B8%A2%E0%B8%B1%E0%B8%87%E0%B9%84%E0%B8%87%E0%B9%83%E0%B8%AB%E0%B9%89%E0%B9%82%E0%B8%94%E0%B8%99%E0%B9%83%E0%B8%88%E0%B8%81%E0%B8%A5%E0%B8%B8%E0%B9%88%E0%B8%A1%E0%B9%80%E0%B8%9B%E0%B9%89%E0%B8%B2%E0%B8%AB%E0%B8%A1%E0%B8%B2%E0%B8%A2-768x480.jpg',
                  myurl: 'https://www..com/%E0%B8%88%E0%B8%B1%E0%B8%94%E0%B9%82%E0%B8%9B%E0%B8%A3%E0%B9%82%E0%B8%A1%E0%B8%8A%E0%B8%B1%E0%B9%88%E0%B8%99%E0%B9%83%E0%B8%AB%E0%B9%89%E0%B9%82%E0%B8%94%E0%B8%99%E0%B9%83%E0%B8%88/',),
                  for(int i=0;i<=5;i++) MyCard()
                  

            ],
          ),
        );
}





}








/*
import 'package:SumApp_1/screen/Notififacation/components/Header.dart';
import 'package:flutter/material.dart';
import 'package:SumApp_1/constant.dart';
import 'mycard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    //var size = MediaQuery.of(context).size;
    //final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    //final double itemWidth = size.width;

    return Container(
      color: kPrimaryBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            //padding: const EdgeInsets.all(12.0),
            child: Center(
              child: HeaderNotification(),
            ),
          ),
         Expanded(
            //flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, //.horizontal
              child: Column(
                children: [
                  MyCard(onlinepic: true,
                  onlinePicPath: 'https://www.smeleader.com/wp-content/uploads/2019/04/%E0%B8%88%E0%B8%B1%E0%B8%94%E0%B9%82%E0%B8%9B%E0%B8%A3%E0%B9%82%E0%B8%A1%E0%B8%8A%E0%B8%B1%E0%B9%88%E0%B8%99%E0%B8%A2%E0%B8%B1%E0%B8%87%E0%B9%84%E0%B8%87%E0%B9%83%E0%B8%AB%E0%B9%89%E0%B9%82%E0%B8%94%E0%B8%99%E0%B9%83%E0%B8%88%E0%B8%81%E0%B8%A5%E0%B8%B8%E0%B9%88%E0%B8%A1%E0%B9%80%E0%B8%9B%E0%B9%89%E0%B8%B2%E0%B8%AB%E0%B8%A1%E0%B8%B2%E0%B8%A2-768x480.jpg',
                  myurl: 'https://www.smeleader.com/%E0%B8%88%E0%B8%B1%E0%B8%94%E0%B9%82%E0%B8%9B%E0%B8%A3%E0%B9%82%E0%B8%A1%E0%B8%8A%E0%B8%B1%E0%B9%88%E0%B8%99%E0%B9%83%E0%B8%AB%E0%B9%89%E0%B9%82%E0%B8%94%E0%B8%99%E0%B9%83%E0%B8%88/',),
                  for(int i=0;i<=10;i++) MyCard()
                  
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
*/