//@dart=2.9
import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:women_safety_app/Home.dart';
import 'package:women_safety_app/fighting_women.dart';

import 'emergence_contact.dart';
class navigationbar_controller extends StatefulWidget {
  const navigationbar_controller({Key key}) : super(key: key);

  @override
  _navigationbar_controllerState createState() => _navigationbar_controllerState();
}

class _navigationbar_controllerState extends State<navigationbar_controller> {
  int selected_index=0;
  final select_screen=[Home(),emergence_contact(),fighting_women()];
   DateTime currentdatetimepress;
  @override
  Widget build(BuildContext context) {
    return WillPopScope( onWillPop: onwillpop,
    child: Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
        height: 50.0,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.deepPurpleAccent,
        items: <Widget>[
          Icon(Icons.home,size: 30,color: Colors.white,),
          Icon(Icons.contact_emergency_rounded,size: 30,color: Colors.white,),
          Icon(Icons.description_rounded,size: 30,color: Colors.white,),
        ],color: Colors.deepPurpleAccent,
        onTap: (index){
          setState((){selected_index=index;});
        },
      ),
      body: select_screen[selected_index],
    )
    );
  }

  Future<bool> onwillpop()async {
    DateTime currenttime=DateTime.now();
    bool backpress=currentdatetimepress==null || currenttime.difference(currentdatetimepress)>Duration(seconds: 2);
    if(backpress){
      currentdatetimepress=currenttime;
      Fluttertoast.showToast(msg: 'Double Click To Exit.!!',toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM,timeInSecForIosWeb: 1,backgroundColor: Colors.grey,textColor: Colors.white);
      return false;
    }
    return true;
  }
}
