//@dart=2.9
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:women_safety_app/read_data_form_firestore.dart';
import 'package:women_safety_app/write_data_to_firestore.dart';

import 'all_screen_transition.dart';

class Registration_page extends StatefulWidget {
  const Registration_page({Key key}) : super(key: key);

  @override
  _Registration_pageState createState() => _Registration_pageState();
}

class _Registration_pageState extends State<Registration_page> {
  final name_of_member = TextEditingController();
  final phone_no_of_members = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final repassword = TextEditingController();
  var department = 'Road Department';
  String status_of_auth;
  bool checkvalue = false;
  final formkey = GlobalKey<FormState>();
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepPurpleAccent,
        textColor: Colors.white);
  }

  var adminemail, passwordadmin, logo_image;

  dynamic logo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.deepPurpleAccent,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Registration',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/login_page_vector_image.png',
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
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Registration',
                              style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'lobster'),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 300,
                            child: Form(
                              key: formkey,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 30, 10, 0.0),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        controller: name_of_member,
                                        validator: (val) => val.isNotEmpty
                                            ? null
                                            : "Plz Enter name..!!",
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.deepPurpleAccent,
                                                    width: 1)),
                                            prefixIcon: const Icon(
                                              Icons
                                                  .drive_file_rename_outline_rounded,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            hintText: 'Full Name Of Members'),
                                        style: TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontSize: 12.0,
                                            height: 0.5),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0.0),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        controller: email,
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Please Enter Email.!!';
                                          }
                                          if (!RegExp(
                                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                              .hasMatch(value)) {
                                            return 'Please Enter valid Email';
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
                                              Icons.email_rounded,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            hintText: 'Enter Email of Member:'),
                                        style: TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontSize: 12.0,
                                            height: 0.5),
                                      ),
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
                                        controller: phone_no_of_members,
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
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0.0),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        controller: password,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'Plz Enter Password';
                                          }
                                          if (val.length < 4) {
                                            return 'Password Length Must Greater Then 4.!!';
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
                                              Icons.password_sharp,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            hintText: 'Password'),
                                        style: TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontSize: 12.0,
                                            height: 0.5),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0.0),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        controller: repassword,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'Plz Enter Re-Password';
                                          }
                                          if (password.text !=
                                              repassword.text) {
                                            return 'Password Does Not Match.!!';
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
                                              Icons.password_sharp,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            hintText: 'Re-Password'),
                                        style: TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontSize: 12.0,
                                            height: 0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(30, 20.0, 30.0, 00.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (formkey.currentState.validate()) {
                                    try {
                                      //register member to firebase auth
                                      await firebaseAuth
                                          .createUserWithEmailAndPassword(
                                              email: email.text
                                                  .toLowerCase()
                                                  .trim(),
                                              password: password.text);
                                      status_of_auth = "Success";
                                    } on FirebaseAuthException catch (e) {
                                      switch (e.code) {
                                        case "ERROR_EMAIL_ALREADY_IN_USE":
                                        case "account-exists-with-different-credential":
                                        case "email-already-in-use":
                                          showToast("Email already used.");
                                          break;
                                        case "ERROR_TOO_MANY_REQUESTS":
                                        case "operation-not-allowed":
                                          showToast(
                                              "Too many requests to log into this account.");
                                          break;
                                        case "ERROR_OPERATION_NOT_ALLOWED":
                                        case "operation-not-allowed":
                                          showToast(
                                              "Server error, please try again later.");
                                          break;
                                        case "ERROR_INVALID_EMAIL":
                                        case "invalid-email":
                                          showToast(
                                              "Email address is invalid.");
                                          break;
                                        default:
                                          showToast(
                                              "Please Enter Email-id/ Password.");
                                          break;
                                      }
                                    } catch (e) {
                                      showToast(e.toString());
                                    }
                                    if (status_of_auth != "Failed") {
                                      // login again admin because due to createuserwithemialandpassword  that user logged in

                                      await add_members_to_database(
                                          name_of_member.text,
                                          phone_no_of_members.text,
                                          email.text.toLowerCase().trim(),
                                          password.text);
                                      showToast('SuccessFully Registered.!!');
                                    }
                                    return;
                                  } else {
                                    print("UnSuccessfull");
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.deepPurpleAccent),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)))),
                                child: Text('Submit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    )),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
