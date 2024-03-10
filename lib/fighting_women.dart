//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/fighting_details.dart';
import 'package:women_safety_app/read_data_form_firestore.dart';

import 'Login_Page.dart';
import 'all_screen_transition.dart';

class fighting_women extends StatefulWidget {
  const fighting_women({Key key}) : super(key: key);

  @override
  _fighting_womenState createState() => _fighting_womenState();
}

class _fighting_womenState extends State<fighting_women> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0
        ,backgroundColor: Colors.deepPurpleAccent,centerTitle: true,title: Text('Helping Technique',style: TextStyle(color: Colors.white,),),),

      body: SingleChildScrollView(
        child: Column(mainAxisAlignment:MainAxisAlignment.spaceAround,
          mainAxisSize:MainAxisSize.max,
          children: <Widget>[
          Row(mainAxisSize:MainAxisSize.max,
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
              onTap: (){Navigator.push(context, scale_transition (child:fighting_details(no:0,)));}
              ,child:  Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/9)),
                child: Padding(padding: EdgeInsets.all(5),
                    child:Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.height/4
                        ,child:Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget> [
                        Image.asset('images/hammer_strike.jpg',width: MediaQuery.of(context).size.width/5,
                          height: MediaQuery.of(context).size.height/5,),
                        Align(
                          alignment: Alignment.center,
                          child:  Text(
                            'Hammer strike',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'lobster'),
                          ),

                        ),
                      ],)
                    )),),),
              InkWell(
                onTap: (){Navigator.push(context, scale_transition (child:fighting_details(no:1,)));}
                ,child:
              Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/9)),
                child: Padding(padding: EdgeInsets.all(5),
                    child:Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.height/4
                        ,child:Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget> [
                        Image.asset('images/groin_kick.jpg',width: MediaQuery.of(context).size.width/5,
                          height: MediaQuery.of(context).size.height/5,),
                        Align(
                          alignment: Alignment.center,
                          child:  Text(
                            'Groin kick',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'lobster'),
                          ),

                        ),
                      ],)
                    )),),)
            ],),
            Row(mainAxisSize:MainAxisSize.max,
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: (){Navigator.push(context, scale_transition (child:fighting_details(no:2,)));}
                  ,child:
                Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/9)),
                  child: Padding(padding: EdgeInsets.all(5),
                      child:Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          height: MediaQuery.of(context).size.height/4
                          ,child:Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:<Widget> [
                          Image.asset('images/elbow_strike.jpg',width: MediaQuery.of(context).size.width/5,
                            height: MediaQuery.of(context).size.height/5,),
                          Align(
                            alignment: Alignment.center,
                            child:  Text(
                              'Elbow strike',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'lobster'),
                            ),

                          ),
                        ],)
                      )),),),
                InkWell(
                  onTap: (){Navigator.push(context, scale_transition (child:fighting_details(no:3,)));}
                  ,child:
                Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/9)),
                  child: Padding(padding: EdgeInsets.all(5),
                      child:Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          height: MediaQuery.of(context).size.height/4
                          ,child:Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:<Widget> [
                          Image.asset('images/bear_hug_attack.jpg',width: MediaQuery.of(context).size.width/5,
                            height: MediaQuery.of(context).size.height/5,),
                          Align(
                            alignment: Alignment.center,
                            child:  Text(
                              'bear hug attack',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'lobster'),
                            ),

                          ),
                        ],)
                      )),),),
              ],),
            Row(mainAxisSize:MainAxisSize.max,
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: (){Navigator.push(context, scale_transition (child:fighting_details(no:4,)));}
                  ,child:
                Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/9)),
                  child: Padding(padding: EdgeInsets.all(5),
                      child:Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          height: MediaQuery.of(context).size.height/3
                          ,child:Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:<Widget> [
                          Image.asset('images/escape_with_hands.jpg',width: MediaQuery.of(context).size.width/5,
                            height: MediaQuery.of(context).size.height/5,),
                          Align(
                            alignment: Alignment.center,
                            child:  Text(
                              'Escape with hands trapped',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'lobster'),
                            ),

                          ),
                        ],)
                      )),),),
                InkWell(
                  onTap: (){Navigator.push(context, scale_transition (child:fighting_details(no:5,)));}
                  ,child:
                Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/9)),
                  child: Padding(padding: EdgeInsets.all(5),
                      child:Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          height: MediaQuery.of(context).size.height/3
                          ,child:Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:<Widget> [
                          Image.asset('images/escape_from_side_headlock.jpg',width: MediaQuery.of(context).size.width/5,
                            height: MediaQuery.of(context).size.height/5,),
                          Align(
                            alignment: Alignment.center,
                            child:  Text(
                              'Escape from side headlock',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'lobster'),
                            ),

                          ),
                        ],)
                      )),),),
              ],),

        ],),
      ),
    );
  }
}
