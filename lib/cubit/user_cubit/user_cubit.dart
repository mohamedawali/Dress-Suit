import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dress_suit/connection/user.dart';
import 'package:dress_suit/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  Repository repository=Repository();
 Users _users=Users();
  var emails;
  var url;
  UserCubit() : super(UserInitial());



  void saveUserData(String name,String phone,String adress){
    repository.saveUserData(name, phone, adress);
  }
 //  void getEmail() {
 // repository.getEmail().then((email) {
 //      emit(Loademail(email));
 //    });
 //  }
  // void getId(){
  //   var id = repository.getId();
  //   print(id);
  //
  //   //  emails = FirebaseAuth.instance.currentUser!.email;
  //    // print(emails);
  //    // emit(Loademail(emails));
  //
  // }

void upload(String basename,File _image){
    _users.uploadImage(basename,_image);
}
// void getuserImage(){
//   url=  repository.url;
//   print(url);
//     emit(getImageUrl(url));
// }
}
