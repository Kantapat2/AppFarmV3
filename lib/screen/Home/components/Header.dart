import 'package:SumApp_1/screen/Cart/Cart.dart';
import 'package:flutter/material.dart';
import 'package:SumApp_1/Constants/constant.dart';

class Header extends StatelessWidget {
  BuildContext context;
  String mypicpath= 'images/1.png';
  Size size;
  String nameId = 'Guest';

  @override
  Widget build(BuildContext _context) {
    context = _context;
    size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: size.height *0.3,
          width: size.width,
          margin: EdgeInsets.only(
            bottom: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60)),
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.15,
              ),
              Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textHeader(),
                      Container( 
                        width: size.width*0.25,
                        height: size.height*0.15,
                        //color: Colors.blue,
                    decoration: BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    image: new DecorationImage(
                      image: new ExactAssetImage(
                          '$mypicpath'), // NetworkImage(url)
                      fit: BoxFit.cover,
                    ),
                    //image: Image.asset('$mypicpath'),
                 ),
                  ),
                      // Icon(
                      //   Icons.supervised_user_circle_sharp,
                      //   size: 90,
                      //   color: Colors.white,
                      // )
                    ],
                  ),
                ),
              
              Spacer(),
              Container(
                margin: EdgeInsets.only(left: 0, top: 10, right: 0),
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                    /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage()
                    ),
                  );*/
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            height: 54,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23))
              ],
            ),
            //<---- Search bar
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget textHeader() {
    return Container(
      margin: EdgeInsets.only(right: 30),
      //height: MediaQuery.of(context).size.height * 0.5,
      width: size.width * 0.4,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text('ยินดีต้อนรับ', //<---------คำอธิบาย
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 30,
                        color: Colors.white)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                //margin: EdgeInsets.only(bottom: 10),
                child: Text('$nameId', //<---------คำอธิบาย
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 30,
                        color: Colors.white)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ),
        ],
      ),
    );
  }
}
