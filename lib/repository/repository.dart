import 'package:dress_suit/connection/user.dart';
import 'package:dress_suit/model/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../connection/signUp.dart';

class Repository {
  Users users = Users();
  SignFire signFire = SignFire();
  var url;

  Future signUp(String email, String pass) async {
    await signFire.signUp(email, pass);
  }

  Future signIn(String email, String pass) async {
    await signFire.signIn(email, pass);
  }

  void saveUserData(String name, String phone, String adress) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString('id');
    UserData userData = UserData(id, name, phone, adress,
        '/data/user/0/com.example.dress_suit/cache/image_picker7544790452527291094.jpg');
    //users.saveUserData(name,phone,adress);
    users.saveUserData(userData);
  }

  Future<UserData> viewUserData() async {
    final getdata = await users.viewUserData();

    return getdata.map((data) => UserData.fromMap(data));
  }
  // Future getEmail()async{
  //   return await users.getEmail();
  // }

//  Future getId()async{
//
//    return  await signFire.getId();
//
//  }
// void getuserImage(){
//  url= users!.url;
// }
}
