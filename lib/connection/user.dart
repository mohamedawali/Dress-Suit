import 'dart:io';
import 'dart:math';

import 'package:dress_suit/model/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Users {
  var url;
  //var email;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void uploadImage(String basename, File image) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('UserImage/$basename');
    UploadTask uploadTask = reference.putFile(image);
    await uploadTask.then((p0) => p0.ref.getDownloadURL().then((value) => url = value));
    return url;
  }
  void saveUserData(UserData userData) async {
    var ref = FirebaseDatabase.instance.ref().child('UserData').set(userData.tomap())
        .then((value) => print('stored'));
  }
  Future viewUserData() async {
    var map;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString('id');
    var ref = FirebaseDatabase.instance.ref().child('UserData').child(id!).onValue.listen((event) {
      if (event != null) {
        map = new Map<String, dynamic>.from((event.snapshot.value) as dynamic );
        return map;
      } else {
        return null;
      }
    });

    // print('stored'));
  }

  // Future getEmail() async {
  //   return await firebaseAuth.currentUser!.email;
  // }
}
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
