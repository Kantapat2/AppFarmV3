import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:SumApp_1/screen/Info/NewBuyer_info_page.dart';

class MyCard extends StatelessWidget {
  Size size;
  String mypicpath;
  bool onlinepic;
  String onlinePicPath;
  String myurl;

  MyCard(
      {this.onlinepic = false,
      this.mypicpath = "images/defau_img.jpg",
      this.myurl = 'https://www.google.co.th/',
      this.onlinePicPath =
          'https://referbruv.com/data/Admin/2020/1/bitmap.png'});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    Widget mycardSelect;

    if (onlinepic) {
      mycardSelect = GestureDetector(
          onTap: () {
            _launchInWebViewOrVC(myurl);
            print('tab Me');
          },
          child: mycardReal());
    } else {
      mycardSelect = GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewInfoPageBuyer('XDD')));
            print('tab Me');
          },
          child: mycardReal());
    }

    return mycardSelect;
  }

  Widget mycardReal() {
    return Container(
      width: size.width,
      height: size.height * 0.3,
      margin: EdgeInsets.all(5),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5, // เงา
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: mypic(),
      ),
    );
  }

  Widget mypic() {
    Widget x;
    if (onlinepic) {
      x = Image.network(
        onlinePicPath,
        fit: BoxFit.fill,
      );
    } else {
      x = Image.asset(
        '$mypicpath',
        fit: BoxFit.fill,
      );
    }
    return x;
  }

  Future<void> _launchInWebViewOrVC(String url) async {
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
}
