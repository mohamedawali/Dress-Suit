import 'dart:io';

import 'package:dress_suit/model/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class User_Profil  extends StatelessWidget {
  UserData userData;
   User_Profil ({Key? key,required this. userData}) : super(key: key);



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

                child:Column(children: [CircleAvatar(maxRadius: 60,child: Image.asset('assets/userImage/user.png')),


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

                              color: Colors.black26,
                            ),
                          ],
                        ),
                        child:

                            Padding(
                          padding: const EdgeInsets.only(
                              right: 15, left: 15, bottom: 25),
                          child:

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
                                            fontSize: 16)),
                                    Text(userData.name  ??  ' Not Data'
                                   ,
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

                                          style: const TextStyle(fontFamily: 'en',
                                              color: Colors.black,
                                              fontSize: 18)),
                                    ])
                              ])))]))));

                          }}


