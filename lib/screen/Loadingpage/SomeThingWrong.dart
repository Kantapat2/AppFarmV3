import 'package:SumApp_1/Constants/constant.dart';
import 'package:SumApp_1/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        color: kPrimaryBgColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.3,
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sorry something went wrong.',
                    style: TextStyle(fontSize: 20),
                  ),
                  FlatButton(
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                    onPressed: () {
                      print('pess me');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyApp()),
                    );
                  },
                    child: Text(
                      "Go Home",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              )),
        ),
      
    );
  }
}
