//@dart=2.9
import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:women_safety_app/read_data_form_firestore.dart';

import 'navigation_bar.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.light,
    home:MyApp(),
    theme:ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.deepPurple,
      primaryColor:Colors.deepPurpleAccent,
      accentColor: Colors.deepPurpleAccent,

    ),
  ));
}
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:FutureBuilder(
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return AlertDialog(title: const Text('Error:-',style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,),),
                content: Text('${snapshot.error}',style: TextStyle(fontSize: 12),),
                actions:<Widget> [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                ],

              );
            } else if (snapshot.hasData) {
              // Extracting data from snapshot object
              final data = snapshot.data;
              return Stack(
                children: <Widget>[

                  AnimatedSplashScreen(splash: Image.asset("images/logo.png"),
                    splashIconSize:MediaQuery.of(context).size.width/3,
                    nextScreen:data,
                    splashTransition: SplashTransition.rotationTransition,
                    animationDuration: Duration(seconds: 4),
                    curve: Curves.easeInOutBack,
                  ),
                  ClipPath(
                    clipper: main_dart_clipper(),
                    child: Container(color: Colors.deepPurpleAccent,),
                  ),
                  Align(alignment: Alignment.bottomCenter,
                    child: Padding(padding: EdgeInsets.only(bottom: 80.0),
                      child: Text('Welcome To Sevak', style: TextStyle(
                          fontFamily: 'lobster',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width/19,
                          letterSpacing: 1,
                          color: Colors.deepPurple),),
                    ),),
                ],

              );
            }
          }

          // Displaying LoadingSpinner to indicate waiting state
          return Container(width: double.infinity,height:double.infinity,) ;
        },
        // Future that needs to be resolved
        // inorder to display something on the Canvas
        future:get_user_dept_details_for_screen_to_load(),
      ),
    );
  }
}

class main_dart_clipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path=Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height/6);
    var first_control_point=Offset(size.width/1.1, size.height/5.5);
    var first_ending_point=Offset(size.width/1.2, size.height/7);
    path.quadraticBezierTo(first_control_point.dx, first_control_point.dy, first_ending_point.dx, first_ending_point.dy);
    var second_control_point=Offset(size.width/1.2, size.height/14);
    var second_ending_point=Offset(size.width/1.5, size.height/18);
    path.quadraticBezierTo(second_control_point.dx, second_control_point.dy, second_ending_point.dx, second_ending_point.dy);
    var third_control_point=Offset(size.width/2, size.height/20);
    var third_ending_point=Offset(size.width/2, 0.0);
    path.quadraticBezierTo(third_control_point.dx, third_control_point.dy, third_ending_point.dx, third_ending_point.dy);

    path.moveTo(0.0,size.height);
    path.lineTo(0.0, size.height-80);
    var fourth_control_point=Offset(size.width/7, size.height-80);
    var fourth_ending_point=Offset(size.width/4-10, size.height-50);
    path.quadraticBezierTo(fourth_control_point.dx, fourth_control_point.dy, fourth_ending_point.dx, fourth_ending_point.dy);
    var fivth_control_point=Offset(size.width/4+20, size.height-15);
    var fivth_ending_point=Offset(size.width/2.5, size.height-20);
    path.quadraticBezierTo(fivth_control_point.dx, fivth_control_point.dy, fivth_ending_point.dx, fivth_ending_point.dy);
    var sixth_control_point=Offset(size.width/2-10, size.height-20);
    var sixth_ending_point=Offset(size.width/2, size.height);
    path.quadraticBezierTo(sixth_control_point.dx, sixth_control_point.dy, sixth_ending_point.dx, sixth_ending_point.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}
