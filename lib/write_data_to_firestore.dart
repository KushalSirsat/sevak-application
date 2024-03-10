//@dart=2.9

import 'package:women_safety_app/read_data_form_firestore.dart';

Future<void> add_members_to_database(String name,String phone,String email,String password)async{
  String membercounter,dept_count;
  int membercounter1,dept_count1;

    await firestore.collection('User').doc(email).set({
      'name':name,
      'mobile_no':phone,
      'email':email,
      'password':password,
      'phone_count':0,
    });


}

Future<void> add_Phone_NO(String name,String phone,String email,int count)async{

    await firestore.collection('User').doc(email).update({
      'phone_count':count,
    }).whenComplete(() async{
      await firestore.collection('Phone_No').doc(email+phone).set({
        'name':name,
        'mobile_no':phone,
        'email':email,

      });
    });

}

  
  
