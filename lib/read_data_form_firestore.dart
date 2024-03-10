//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:women_safety_app/Login_Page.dart';
import 'package:women_safety_app/navigation_bar.dart';

FirebaseFirestore firestore=FirebaseFirestore.instance;
FirebaseAuth  firebaseAuth=FirebaseAuth.instance;
var current_email=firebaseAuth.currentUser.email;

get_user_dept_details_for_screen_to_load()async{
  try {
  // Get reference to Firestore collection
  if(firebaseAuth.currentUser!=null){
    String Doc_id =firebaseAuth.currentUser.email;
    var admin_collection = await firestore.collection('User').doc(Doc_id).get();
    if(admin_collection.exists){
      return navigationbar_controller();
    }

  }else{
    return Login_page();
  }
  }
  catch (e) {
    throw e;
  }
}
get_data_with_2_where_condition(String collection_name,String field1,String value1,String field2,String value2)async{
  List data=[];
  int length;
  await firestore.collection('$collection_name').where('$field1',isEqualTo:'$value1').where('$field2',isEqualTo:'$value2').get().then((value){
    if(value!=null){
      value.docs.forEach((element) {
        data.add(element.data());
      });
      length =value.docs.length;
    }
  });
  return [length,data];
}
get_data_from_dept_head(String collection_name,String field1,String value1,String field2,String value2)async{
  List data=[];
  int length;
  String total,solved,unsolved;
  await firestore.collection('$collection_name').where('$field1',isEqualTo:'$value1').where('$field2',isEqualTo: '$value2').get().then((value){
    value.docs.forEach((element) {
      data.add(element.data());
    });
    length=value.docs.length;
  }).whenComplete(()async {
    await firestore.collection("count").doc('$value1').get().then((value) {
      if(value.exists){
        total=value.data()['$value2'+'_total'];
        solved=value.data()['$value2'+'_solved'];
        unsolved=value.data()['$value2'+'_unsolved'];
      }
    });
  });
  return [length,data,total,solved,unsolved];
}

