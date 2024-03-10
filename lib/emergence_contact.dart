//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:women_safety_app/read_data_form_firestore.dart';

import 'Login_Page.dart';
import 'all_screen_transition.dart';

class emergence_contact extends StatefulWidget {
  const emergence_contact({Key key}) : super(key: key);

  @override
  _emergence_contactState createState() => _emergence_contactState();
}

class _emergence_contactState extends State<emergence_contact> {
  Widget card_display_complaint_record(String name,String contactno){
    return Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5),
            child: Align(alignment: Alignment.topLeft,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/9,
                    height: MediaQuery.of(context).size.height/16,
                    child:Icon(Icons.call)    ),
                  Column(children: <Widget>[
                   Row(
                        children: <Widget>[
                          Text('Name : ',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 12,fontWeight: FontWeight.bold),),
                          Text('$name',style: TextStyle(color: Colors.deepPurpleAccent,fontSize:12,fontWeight: FontWeight.bold,fontFamily: 'cinzelbold'),),
                        ],),
                    Row(
                      children: <Widget>[
                        Text('Call : ',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 12,fontWeight: FontWeight.bold),),
                        Text('$contactno',style: TextStyle(color: Colors.deepPurpleAccent,fontSize:12,fontWeight: FontWeight.bold,fontFamily: 'cinzelbold'),),
                      ],),
                    /*  Row(
                      children: <Widget>[
                        Text('Mobile No : ',style: TextStyle(color: Colors.orangeAccent,fontSize: 12,fontWeight: FontWeight.bold),),
                        Text('${dataFormFirestore.data[index]['mobile_no']}',style: TextStyle(color: Colors.orangeAccent,fontSize:12,fontWeight: FontWeight.bold,fontFamily: 'cinzelbold'),),
                      ],),*/
                  ],),
                ],),
            ),),

        ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0
        ,backgroundColor: Colors.deepPurpleAccent,centerTitle: true,title: Text('Emergence',style: TextStyle(color: Colors.white,),),),

      body:SingleChildScrollView(
        child:  Stack(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/emergence_image.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Padding(
              padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Emergence',
                              style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'lobster'),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(padding:EdgeInsets.all(5)
                              ,child: InkWell(onTap: (){//FlutterPhoneDirectCaller.callNumber('+100');
                                // ignore: deprecated_member_use
                                launch('tel:+100');
                                 }
                                  ,child:  Container(
                                      margin: EdgeInsets.all(20),
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.orangeAccent, // Set border color
                                              width: 1.0),   // Set border width
                                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6), // Set rounded corner radius
                                          boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orangeAccent,offset: Offset(1,3))] // Make rounded corner of border
                                      ),
                                      child:Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6)),
                                          child: card_display_complaint_record("Police","100")
                                      )
                                  )
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(padding:EdgeInsets.all(5)
                              ,child: InkWell(onTap: (){//FlutterPhoneDirectCaller.callNumber('+100');
                                // ignore: deprecated_member_use
                                launch('tel:+108');
                              }
                                  ,child:  Container(
                                      margin: EdgeInsets.all(20),
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.orangeAccent, // Set border color
                                              width: 1.0),   // Set border width
                                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6), // Set rounded corner radius
                                          boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orangeAccent,offset: Offset(1,3))] // Make rounded corner of border
                                      ),
                                      child:Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6)),
                                          child: card_display_complaint_record("Ambulance","108")
                                      )
                                  )
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(padding:EdgeInsets.all(5)
                              ,child: InkWell(onTap: (){//FlutterPhoneDirectCaller.callNumber('+100');
                                // ignore: deprecated_member_use
                                launch('tel:+101');
                              }
                                  ,child:  Container(
                                      margin: EdgeInsets.all(20),
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.orangeAccent, // Set border color
                                              width: 1.0),   // Set border width
                                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6), // Set rounded corner radius
                                          boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orangeAccent,offset: Offset(1,3))] // Make rounded corner of border
                                      ),
                                      child:Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6)),
                                          child: card_display_complaint_record("Fire Brigade","101")
                                      )
                                  )
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(padding:EdgeInsets.all(5)
                              ,child: InkWell(onTap: (){//FlutterPhoneDirectCaller.callNumber('+100');
                                // ignore: deprecated_member_use
                                launch('tel:+181');
                              }
                                  ,child:  Container(
                                      margin: EdgeInsets.all(20),
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.orangeAccent, // Set border color
                                              width: 1.0),   // Set border width
                                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6), // Set rounded corner radius
                                          boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orangeAccent,offset: Offset(1,3))] // Make rounded corner of border
                                      ),
                                      child:Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6)),
                                          child: card_display_complaint_record("Women Helpline","181")
                                      )
                                  )
                              )),
                        ),
                      ],),
                  ],),
              ),),
          ]),

      ),
    );
  }
}
