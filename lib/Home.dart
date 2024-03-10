//@dart=2.9
import 'dart:async';
import 'dart:math';


import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shake/shake.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:women_safety_app/read_data_form_firestore.dart';
import 'package:women_safety_app/all_screen_transition.dart';
import 'package:women_safety_app/login_page.dart';
import 'package:women_safety_app/write_data_to_firestore.dart';
class Home extends StatefulWidget{
    const Home({Key key}) : super(key: key);

    @override
    _Home createState() => _Home();
  }
SpeechToText speechToText=SpeechToText();
String speech_reslut;
//state class
class _Home extends State<Home>{
int length;String authstatus="0";String _message, body;
List <String> phone_no_list=[];
String lat,long,msg;
final name=TextEditingController();
final mobile=TextEditingController();
int count;


final player=AudioCache();
//initisized
void initState() {
  super.initState();
  ShakeDetector detector = ShakeDetector.autoStart(
    onPhoneShake: () async{
        //code to run on every 2 minutes 5 seconds
        bool available = await speechToText.initialize(
          onStatus: (val)=>print('onStatus: $val'),
          onError: (val)=>print('onStatus: $val'),
        );
        if(available){

            speechToText.listen(onResult: (result){
              setState(() {
                speech_reslut=result.recognizedWords;

              });
            });

        }
        Timer(Duration( seconds: 10), () async{
          //code to run on every 2 minutes 5 seconds


          await _getCurrentLocation().then((value){msg='Lat: ${value.latitude}Long: ${value.longitude} \n speech: $speech_reslut';});
          await speechToText.stop();
          await player.play('police_siren.mp3');
          _sendSMS(phone_no_list, msg);
        });



      // Do stuff on phone shake
    },
    minimumShakeCount: 1,
    shakeSlopTimeMS: 500,
    shakeCountResetTime: 3000,
    shakeThresholdGravity: 2.7,
  );
}

Future<void> _sendSMS(List<String> recipients,String _controllerMessage) async {
  try {   print(recipients);
    String _result = await sendSMS(
      message: _controllerMessage,
      recipients: recipients,
      sendDirect: false,
    );
    setState(() => _message = _result);
  } catch (error) {
    setState(() => _message = error.toString());
  }

}
void showToast(String msg){
  Fluttertoast.showToast(msg: msg,toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER,timeInSecForIosWeb: 1,backgroundColor: Colors.orangeAccent,textColor: Colors.white);
}
Future<Position> _getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

  get_data_form_firestore_admin()async{
    List data=[];
    await firestore.collection('Phone_No').where('email',isEqualTo:current_email).get().then((value){
      value.docs.forEach((element) {
        data.add(element.data());
        phone_no_list.add(element.data()['mobile_no'].toString());
      });length=value.docs.length;
    });
    return data;
  }
  Widget card_display_complaint_record(AsyncSnapshot dataFormFirestore ,int index){
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
                    child:Icon(Icons.message_rounded)  ),
                  Column(children: <Widget>[
                     Row(
                        children: <Widget>[
                          Text('Name : ',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 12,fontWeight: FontWeight.bold),),
                          Text('${dataFormFirestore.data[index]['name']}',style: TextStyle(color: Colors.deepPurpleAccent,fontSize:12,fontWeight: FontWeight.bold,fontFamily: 'cinzelbold'),),
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
    // TODO: implement build
    Future opendDialog()=>showDialog(context: context, builder: (context)=>AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/10)),
      elevation: 10,
      title:  Align(alignment: Alignment.topLeft,
        child: Padding(padding: EdgeInsets.only(left: 10),
          child: Text('Enter Name & Mobile No',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,fontFamily: 'lobster'),
          ),
        ),
      ),
      content: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,mainAxisSize: MainAxisSize.min,children:<Widget> [
        Padding(padding: EdgeInsets.only(left: 20,right: 10),
          child: TextField(keyboardType: TextInputType.name,textCapitalization: TextCapitalization.sentences,controller: name,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide(color: Colors.deepPurple,width: 1)),prefixIcon: const Icon(Icons.email_rounded,color: Colors.deepPurpleAccent,),hintText: 'Name'),
            style: TextStyle(fontSize: 12.0,height: 0.5),
          ),
        ),
        Padding(
          padding:
          EdgeInsets.fromLTRB(10, 10, 10, 0.0),
          child: Container(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              textCapitalization:
              TextCapitalization.sentences,
              controller: mobile,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (val) {
                if (val.isEmpty) {
                  return "Plz Enter Mobile No.!!";
                }
                if (val.trim().length != 10) {
                  return "Enter Valid Mobile NO.!!";
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                          color:
                          Colors.deepPurpleAccent,
                          width: 1)),
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.deepPurpleAccent,
                  ),
                  hintText: 'Phone No'),
              maxLength: 10,
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 12.0,
                  height: 0.5),
            ),
          ),
        ),
      ],),
      actions: [
        Align(alignment: Alignment.topRight,
          child: SizedBox(
            width: 200,
            child: Padding(padding: EdgeInsets.fromLTRB(30,20.0,30.0,00.0),
                child: ElevatedButton(onPressed: () async {
                  await firestore.collection('User').doc(firebaseAuth.currentUser.email).get().then((value){
                    if(value.exists){
                      count=value.data()['phone_count'];
                    }
                  });
                  if((count+1)<=3) {
                    await add_Phone_NO(name.text, mobile.text, firebaseAuth.currentUser.email,count+1);
                    showToast("SuccessFully Added");
                  }else{showToast("You Can't Add More Than 3 Phone Number");}
                },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)))),
                  child:  Text('ADD',style: TextStyle(color: Colors.white,fontSize: 14.0,)),
                )
            ),
          ),
        ),
      ],
    ));
    return Scaffold(
      appBar:AppBar(elevation: 0,actions: <Widget>[IconButton(icon: Icon(Icons.logout_rounded,color: Colors.white,),onPressed: ()
    {firebaseAuth.signOut();
    Navigator.push(context, right_to_left_transition(child: Login_page(),),);
    },tooltip: "LogOut",)]
      ,backgroundColor: Colors.deepPurpleAccent,centerTitle: true,title: Text('SEVAK',style: TextStyle(color: Colors.white,),),),
      body: FutureBuilder(
        future: get_data_form_firestore_admin(),
    builder: (context,snapshot){
    if(snapshot.connectionState==ConnectionState.done){
    if(snapshot.hasError){
    return AlertDialog(title: const Text('Error:-',style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,),),
    content: Text('${snapshot.error}',style: TextStyle(fontSize: 12),),
    actions:<Widget> [
    TextButton(
    onPressed: () => Navigator.pop(context, 'Cancel'),
    child: const Text('Cancel'),
    ),
    ],

    );
    }
    if(snapshot.hasData){

      return SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.height/2,
            child: CustomPaint(
              painter: OpenPainter( Colors.deepPurpleAccent[100],MediaQuery.of(context).size.width/2,MediaQuery.of(context).size.width/3.3),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.height/2,
            child: CustomPaint(
              painter: OpenPainter( Colors.deepPurpleAccent[200],MediaQuery.of(context).size.width/2,MediaQuery.of(context).size.width/4),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.height/2,
            child: CustomPaint(
              painter: OpenPainter( Colors.deepPurpleAccent[700],MediaQuery.of(context).size.width/2,MediaQuery.of(context).size.width/5),
            ),
          ),
          Center (
            child:  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/3.5,)
              ,child: Image.asset('images/homelogo.png',width: MediaQuery.of(context).size.width/4,height: MediaQuery.of(context).size.height/5,),),


          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/5,top: MediaQuery.of(context).size.height/5.5),
              child: Text(
                'Here',
                style: TextStyle(
                    fontSize:  MediaQuery.of(context).size.width/10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'lobster'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/3.5,top: MediaQuery.of(context).size.height/4),
              child: Text(
                'I AM',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width/10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'abrifatface'),
              ),
            ),
          ),
          Column(
            mainAxisAlignment:MainAxisAlignment.spaceAround,

            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/4,top: MediaQuery.of(context).size.height/2.5),
                  child: Text(
                    'Add Contacts To Be Informed',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width/25,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'lobster'),
                  ),
                ),
              ),
              Container(width:MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  child:ListView.builder(itemCount: length,itemBuilder: (BuildContext cntx,int index){
                    return SingleChildScrollView(scrollDirection: Axis.horizontal,
                        child: Container(
                          width: MediaQuery.of(context).size.width,

                          child: Padding(padding:EdgeInsets.all(5)
                              ,child: InkWell(onTap: (){}
                                  ,child:  Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.deepPurple, // Set border color
                                              width: 1.0),   // Set border width
                                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6), // Set rounded corner radius
                                          boxShadow: [BoxShadow(blurRadius: 10,color: Colors.deepPurpleAccent,offset: Offset(1,3))] // Make rounded corner of border
                                      ),
                                      child:Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6)),
                                          child: card_display_complaint_record(snapshot,index)
                                      )
                                  )
                              )),
                        ));
                  }) ),
            ],),


        ]),
      );


      }
      }
      return Center(child:CircularProgressIndicator());
    },



      ),
    floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      onPressed: opendDialog,hoverColor: Colors.deepPurpleAccent,
    elevation: 10,
    )

    );

  }
}class OpenPainter extends CustomPainter {
  Color color;
  double dx,offset;
  OpenPainter(Color color,double dx, double offset){
    this.color=color;
    this.dx=dx;
    this.offset=offset;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(dx, dx), offset, paint1);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}