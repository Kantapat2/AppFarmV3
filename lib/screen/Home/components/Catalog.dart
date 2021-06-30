import 'package:flutter/material.dart';
import 'package:SumApp_1/screen/Catalog/home_catalog.dart';


class Catalog extends StatelessWidget {
  Size size;
  BuildContext context;
  @override
  Widget build(BuildContext _context) {
    context = _context;
    size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      //color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            //color: Colors.red,
            //height: 30,
            margin: EdgeInsets.only(top: 30, left: 20, bottom: 15),
            child: Text(
              "หมวดหมู่",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          itemsInCatalog()
        ],
      ),
    );
  }

  Widget itemsInCatalog() {

    List listCatalogData =[];
    listCatalogData.add(['สินค้าแปรรูป','images/Processed_Pro.jpg']);
    listCatalogData.add(['สินค้าเกษตร','images/Agricultural_Pro.jpg']);
    listCatalogData.add(['สมุนไพรและสปา','images/Herbs_Spa.jpg']);
    listCatalogData.add(['ผลิตภัณฑ์บำรุงผิว','images/SkinCare.jpg']);
    listCatalogData.add(['งานจักสาน','images/Basketry.jpg']);
    listCatalogData.add(['สิ่งทอ','images/fabric.jpg']);

    return Container(
      //color: Colors.red,
      //height: size.height*0.16,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            // itemInCatalog(
            //     namepro: "สินค้าแปรรูป", picPath: "images/ProcessFood.jpg",  nextCatalog:  BodyCatalog()),
            for (int i = 0; i < listCatalogData.length; i++) itemInCatalog(
              namepro: '${listCatalogData[i][0]}',
              picPath :'${listCatalogData[i][1]}',
               nextCatalog:  CatalogPage())
            //itemInCatalog(picPath: )
          ],
        ),
      ),
    );
  }

  Widget itemInCatalog(
      {String picPath = "images/defau_img.jpg",
      String namepro = "nameCatalog",
      StatefulWidget nextCatalog})
       {
    return Container(
      margin: EdgeInsets.all(10),
//color: Colors.grey,
//width: 100,
//height: 100,
      child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () {
             Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => nextCatalog
                    ),
                  );
          },
                      child: Container(
              //<--- ขนาดรูปภาพ
              height: size.height * 0.1, //68,
              width: size.height * 0.15, //90,
              //margin: EdgeInsets.all(10),
              decoration: new BoxDecoration(
                //border: Border.all( width: 1,),
                borderRadius: BorderRadius.circular(20),
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      '$picPath'), //<-----------------  เปลี่ยนภาพหน้าปก

                  //image: new NetworkImage("https://i.imgur.com/BoN9kdC.png")
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                //margin: EdgeInsets.only(top: 10),
                child: Text('$namepro', //<---------คำอธิบาย
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 14,
                        color: Colors.black)
                    //,overflow: TextOverflow.ellipsis
                    ,
                    textAlign: TextAlign.left)),
          ), //ใช้สำหรับจำกัดขอบเขตภาพ
        ],
      ),
    );
  }


  
}
