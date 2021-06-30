import 'dart:math';

import 'package:SumApp_1/screen/Test/reload.dart';


class ListData {
  final int albumId;
  final int id;

  final String title;
  final String url;
  final String thumbnailUrl;

  ListData({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
  factory ListData.fromJson(Map<String, dynamic> jsonData) {
    return ListData(
      albumId: jsonData['albumId'],
      id: jsonData['id'],
      title: jsonData['title'],
      url: jsonData['url'],
      thumbnailUrl: jsonData['thumbnailUrl'],
    );
  }
}

 

class TempData {
  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String namePro;

  List mylistData() {
    List<Map<String, dynamic>> mylist = [];
    //mylist.add(detailData());
    //print(detailData());
    //print('XDD_pass0');
    for (int i = 0; i <= 5; i++) mylist.add(detailData());

    //print(mylist);
    //print('XDD_pass1');
    //print(mylist);
    return mylist;
  }

  Map<String, dynamic> detailData() {
    // var rng = new Random();

    Map<String, String> details = new Map();
    details['namePro'] = 'namePro_' + _rnd.nextInt(100).toString();
    details['price'] = _rnd.nextInt(100).toString();
    details['at'] = getRandomString(20);
    // details['press'] =(){ // <--- อาจจะ
    //print(details['namePro']);
    //print(details);
    return details;
    // };
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
/*
class DetailData {
  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String namePro;

  List<Map<dynamic, dynamic>> getmydatalist() {
    var data = <Map>[];
    for (int i = 0; i <= _rnd.nextInt(10); i++) {
      data.add(detailData());
      print('$i');
    }

    return data;
  }

  Future<List<Map<String, String>>> testFuture =
      Future<List<Map<String, String>>>.delayed(
    Duration(seconds: 2),
    () {
      Random _rnd = Random();
      String _chars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      List<Map<String, String>> data = [];

      for (int i = 0; i <= 5; i++) {
        String getRandomString(int length) =>
            String.fromCharCodes(Iterable.generate(
                length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
        //var detailData2 = detailData();

        Map<dynamic, dynamic> details = new Map();
        details['namePro'] = 'namePro:' + _rnd.nextInt(100).toString();
        details['price'] = _rnd.nextInt(100).toString();
        details['at'] = getRandomString(10);
        data.add(details);
        print('$i');
      }

      return data;
    },
  );

  Map<String, String> detailData() {
    // var rng = new Random();

    Map<dynamic, dynamic> details = new Map();
    details['namePro'] = 'namePro:' + _rnd.nextInt(100).toString();
    details['price'] = _rnd.nextInt(100).toString();
    details['at'] = getRandomString(10);
    // details['press'] =(){ // <--- อาจจะ

    return details;
    // };
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
*/
