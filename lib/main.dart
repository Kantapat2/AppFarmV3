import 'package:SumApp_1/screen/Notififacation/notification.dart';
import 'package:SumApp_1/screen/profile/profile_screen.dart';
import 'package:SumApp_1/screen/promotions/promo_screen.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:SumApp_1/screen/Home/Home.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
   await SystemChrome.setPreferredOrientations([
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}
class _MyApp extends State<MyApp> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter_Home_tabBar',
      home: Scaffold(

        body: selectpage(currentTabIndex),
        bottomNavigationBar: _mybar(),
      ),
    );
  }


  Widget selectpage(int index) // <------- ตัวเลือก page
  {
    switch (index) {
      case 0:
        return HomePage();  // <----เรียกใช้ ไฟล์ HomePage
        break;
      case 1: 
        return Promooo();//NewContactPage(head: 'XD',title:'XDDD');//
        break;
      case 2:
      return NotificationPage();//NewInfoPageBuyer();
        break;
      case 3:
      return Profile();//CartPage();//Profile();//Mypage();//LoadingPage();//
      /*return Center(
          child: Text('There is no page builder for this index[$index].'),
        );*/
     /* Center(
          child: Text('There is no page builder for this index[$index].'));*/
        break;

      default:
        return 
         Center(
          child: Text('There is no page builder for this index[$index].'),
        );
        break;
    }
  }
  Widget _mybar() {
    return CircleBottomNavigation(
      circleColor:Colors.green,
      activeIconColor:Colors.white,
      textColor:Colors.grey,
      inactiveIconColor:Colors.green,
          initialSelection: currentTabIndex,
          tabs: [
            TabData(icon: Icons.home, title: "หน้าหลัก"),
            TabData(icon: Icons.campaign, title: "โปรโมชั่น"),
            TabData(icon: Icons.notifications_active, title: "แจ้งเตือน"),
            TabData(icon: Icons.settings, title: "การตั้งค่า"),
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentTabIndex = position;
            });
          },
        );
  }
}