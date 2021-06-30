import 'package:SumApp_1/screen/profile/components/Body_Profile.dart';
import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: BodyProfile(),
    );
  }
}
