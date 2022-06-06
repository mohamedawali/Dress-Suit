

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_suit/model/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UsersService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore= FirebaseFirestore.instance;

  String getCurrentUserEmail() {
    return _firebaseAuth.currentUser!.email!;
  }

  void saveUserData(UserData userData) async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set(userData.tomap());

  }

  Future<Map<String, dynamic>?> viewUserData() async {

  var documentSnapshot = await _firebaseFirestore.collection('Users').doc(
      _firebaseAuth.currentUser!.uid).get();


   return documentSnapshot.data();


  }
  void updateUserData(Map<String, dynamic> userData) {
  _firebaseFirestore
        .collection('Users')
        .doc(_firebaseAuth.currentUser!.uid).update(userData);

  }

}
  // Future getUserPhoneNumber(){
  //   var future = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).get();
  //
  //   .then((value) => Map<String, dynamic>.from((value.data()) as dynamic));
  // }



// Future gettUserId() async {
//
//    id= await firebaseAuth.currentUser!.uid;
//     return id;
// }
// Future getEmail() async {
//   return await firebaseAuth.currentUser!.email;
// }

// void saveUserData(UserData userData)async{
//   // SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
//   //
//   // var id = sharedPreferences.getString('id');
//   // UserData userData=UserData(id, name, phone, adress, '/data/user/0/com.example.dress_suit/cache/image_picker7544790452527291094.jpg');
//   //     var ref = FirebaseDatabase.instance.ref().child('UserData').set(userData.tomap()).then((value) =>
//   //         print('stored'));
//   var ref = FirebaseDatabase.instance.ref().child('UserData').set(userData.tomap()).then((value) =>
//       print('stored'));
//
// }
/////////////////////
// Future viewUserData() async {
//   try {
//     var data = await FirebaseDatabase.instance
//         .ref()
//         .child('Users')
//         .child(firebaseAuth.currentUser!.uid)
//         .get();
//
//     return Map<String, dynamic>.from((data.value) as dynamic);
//   } on Exception catch (e) {
//     print(e.toString());
//   }
// }