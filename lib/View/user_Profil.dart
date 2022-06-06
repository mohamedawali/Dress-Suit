import 'dart:io';

import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:dress_suit/model/user_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

// class User_Profil extends StatefulWidget {
//   UserData userData;
//    User_Profil({Key? key,required this.userData}) : super(key: key);
//
//   @override
//   State<User_Profil> createState() => _User_ProfilState();
// }
//
// class _User_ProfilState extends State<User_Profil> {
//   TextEditingController _name = TextEditingController();
//   TextEditingController _phone = TextEditingController();
//   TextEditingController _adress = TextEditingController();
//   File? _image;
//   String? url;
//   var basename;
//   var bloc;
//
//   // SharedPreferences? sharedPreferences;
//   @override
//   void initState() {
//     //BlocProvider.of<UserCubit>(context).gettUserId();
// //    BlocProvider.of<UserCubit>(context).viewUserData();
//     super.initState();
//   }
class User_Profil  extends StatelessWidget {
  UserData userData;
   User_Profil ({Key? key,required this. userData}) : super(key: key);
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _adress = TextEditingController();
  File? _image;
  String? url;
  var basename;
  var bloc;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(foregroundColor: Colors.white,title: Text('الصفحة الشخصية'),centerTitle: true,titleTextStyle: TextStyle(fontFamily: 'ar',fontSize: 20),),
        body: Container(
            color: Colors.grey[200],
            height: double.infinity,
            child: Padding(
                padding: const EdgeInsets.only(top: 50,
                  left: 20,
                  right: 20,
                ),

                //key: _globalKey,
                child:Column(children: [CircleAvatar(maxRadius: 60,child: Image.asset('assets/userImage/user.png')),

               // Center(
                  //  child:
                  SizedBox(height: 50,),
                    Container(
                        height:280,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 1,
                              // spreadRadius: 1,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                        child:

                            Padding(
                          padding: const EdgeInsets.only(
                              right: 15, left: 15, bottom: 25),
                          child:
                          // BlocBuilder<UserCubit, UserState>(
                          //     builder: (context, state) {
                          //   if (state is GetDataUser) {
                          //
                          //
                          //
                          //
                          //     return
                                Column(children: [
                                Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/editProfil',
                                              arguments:userData );
                                        },
                                        icon: const Icon(
                                          Icons.edit_note_rounded,
                                          size: 30,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  textDirection: TextDirection.rtl,
                                  children:  [
                                    Text('الاسم',
                                        style: TextStyle(fontFamily: 'ar',
                                            color: Colors.black,
                                            //  fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text(userData.name  ??  ' Not Data'
                                   ,
                                      // state.userData!.name!,
                                        style: TextStyle(fontFamily: 'en',
                                            color: Colors.black, fontSize: 18)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    const Text('البريد اللكتروني',
                                        style: TextStyle(fontFamily: 'ar',
                                            color: Colors.black, fontSize: 16)),

                                    Text(userData.email ?? 'Not Data'
                                      ,
                              // ' _userData!.email!',
                                     //    state.userData!.email!,
                                        style: const TextStyle(fontFamily: 'en',
                                            color: Colors.black, fontSize: 18)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      const Text('العنوان',
                                          style: TextStyle(fontFamily: 'ar',
                                              color: Colors.black,
                                              fontSize: 16)),
                                      Text(userData.adress  ??  ' Not Data',
                                        //  '_userData!.adress!',
                                       //   state.userData!.adress!,
                                          style: const TextStyle(fontFamily: 'en',
                                              color: Colors.black,
                                              fontSize: 18))
                                    ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      const Text('رقم الموبايل',
                                          style: TextStyle(fontFamily: 'ar',
                                              color: Colors.black,
                                              fontSize: 16)),
                                      Text(userData.phone  ??  ' Not Data',
                                    // '  _userData!.phone!',
                                         //  state.userData!.phone!,
                                          style: const TextStyle(fontFamily: 'en',
                                              color: Colors.black,
                                              fontSize: 18)),
                                    ])
                              ])))]))));

                          }}

                          //



  // void pickImage() async {
  //   var pickImage =
  //       await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(pickImage!.path);
  //   });
  //   basename = path.basename(_image!.path);
  //   print(basename);
  //   print(_image);
  //   bloc.upload(basename, _image);
  // }

