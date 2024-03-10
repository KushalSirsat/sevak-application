//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/read_data_form_firestore.dart';

import 'Login_Page.dart';
import 'all_screen_transition.dart';

class fighting_details extends StatefulWidget {
  int no;
   fighting_details({Key key,@required this.no}) : super(key: key);

  @override
  _fighting_detailsState createState() => _fighting_detailsState();
}

class _fighting_detailsState extends State<fighting_details> {

var image_list=['images/hammer_strike.jpg','images/groin_kick.jpg','images/elbow_strike.jpg','images/bear_hug_attack.jpg','images/escape_with_hands.jpg','images/escape_from_side_headlock.jpg'];
var content_list=['Using your car keys is one of the easiest ways to defend yourself. Don’t use your fingernails, because you’re more at risk to injure your hands.\nInstead, if you feel unsafe while walking at night, have your keys stick out from one side of your fist for hammer strikes.'
  ,'If someone is coming at you from the front, a groin kick may deliver enough force to paralyze your attacker, making your escape possible \n To perform:\nStabilize yourself as best you can.\nLift your dominant leg off the ground and begin to drive your knee upward.\n  Extend your dominant leg, drive hips forward, slightly lean back, and kick forcefully, making contact between your lower shin or ball of your foot and the attacker’s groin area'
,'If your attacker is in close range and you’re unable to get enough momentum to throw a strong punch or kick, use your elbows\nTo perform:\nIf you can, stabilize yourself with a strong core and legs to ensure a powerful blow.\nBend your arm at the elbow, shift your weight forward, and strike your elbow into your attacker’s neck, jawline, chin, or temple. These are all effective targets.\nThis may cause your attacker to loosen their grip, allowing you to run.'
,'For cases where the attacker is coming from behind, you’ll want to use this move. Focus on getting low and creating space to free yourself.\nTo perform:\nBend forward from the waist. This shifts your weight forward, making it more difficult for your attacker to pick you up. It also gives you a better angle to throw elbows from side to side to the attacker’s face.\nTurn into the attacker with one of your elbows and continue counterattacking.\nThis should give you space to turn fully, using another move to injure the face or strike the groin. With the space these moves have created, you may be able to escape and run away.'
,'If your attacker comes from behind and traps your arms (this is similar to a bear hug, but you won’t be able to move as freely), here’s what to do\n\bFirst reaction should be to stop your attacker’s arms from going higher into a headlock. Shift your hips to one side. This gives an opening for strikes to the groin with open-handed slaps.\nBring your hand back up to your arms and raise your opposite elbow to turn into the wrap. Keep your arms tight to your chest as you’re turning in.\nStay aggressive with your knees and other counterattacks until you can disengage.'
,'When the attacker locks their arm around your head from the side, your first instinct should be to avoid getting choked.\nTo perform:\nTurn into the attacker’s side as much as possible to avoid being choked.\nWith your hand that’s furthest away, strike the groin with open-handed slaps until you have enough mobility to turn your head all the way out to disengage.'
];
var fight_names=['Hammer Strike','Groin Kick','Elbow Strike','Bear Hug Attack','Escape With Hands Trapped','Escape From Side Headlock'];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(elevation: 0
        ,backgroundColor: Colors.deepPurpleAccent,centerTitle: true,title: Text('Details',style: TextStyle(color: Colors.white,),),),

      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.height/2,
            child: CustomPaint(
              painter: OpenPainter( Colors.deepPurpleAccent[100],MediaQuery.of(context).size.width/2,MediaQuery.of(context).size.width/2.5),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.height/2,
            child: CustomPaint(
              painter: OpenPainter( Colors.deepPurpleAccent[200],MediaQuery.of(context).size.width/2,MediaQuery.of(context).size.width/3),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.height/2,
            child: CustomPaint(
              painter: OpenPainter( Colors.deepPurpleAccent[700],MediaQuery.of(context).size.width/2,MediaQuery.of(context).size.width/4),
            ),
          ),
          Center (
            child:  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/8,)
              ,child: Image.asset('${image_list[widget.no]}',width: MediaQuery.of(context).size.width/1.3,height: MediaQuery.of(context).size.height/3,),),


          ),

          Column(
            mainAxisAlignment:MainAxisAlignment.spaceAround,

            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.4,left: 20),
                  child: Text(
                    '${fight_names[widget.no]}',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width/12,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'lobster'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 10,left: 20),
                  child: Text(
                    '${content_list[widget.no]}',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width/20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'lobster'),
                  ),
                ),
              ),

            ],),


     ]),
      ),
    );
  }
}
class OpenPainter extends CustomPainter {
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