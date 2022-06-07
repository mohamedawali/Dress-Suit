import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:dress_suit/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Edit_Profil extends StatelessWidget {
  UserData userData;
  Edit_Profil({Key? key,required this.userData}) : super(key: key);
  var bloc;
  TextEditingController? _nameController;

  TextEditingController? _emailController;
  TextEditingController? _adressController;
  TextEditingController? _phoneController;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<UserCubit>(context);
    _nameController = TextEditingController(text:userData.name);
    _emailController = TextEditingController(text: userData.email);
    _adressController = TextEditingController(text: userData.adress);
    _phoneController = TextEditingController(text: userData.phone);

    return Scaffold(
        appBar: AppBar(title:  const Text('تعديل البيانات الشخصية'),centerTitle: true,foregroundColor: Colors.white,titleTextStyle: TextStyle(fontFamily: 'ar',fontSize: 20),),
        body:  Container(
            color: Colors.grey[200],
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),

              //key: _globalKey,
              child: Center(
                    child:
                    SingleChildScrollView(
                        child:Container(
                        height: 430,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 1,
                              // spreadRadius: 1,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                        child: Form(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 14, left: 14, top: 13, bottom: 13),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(style: TextStyle(fontFamily: 'en',fontSize: 20),
                                          controller: _nameController,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            label: Text(
                                              'الاسم',
                                            ),
                                          ))),
                                  //TextFormField()
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(style: TextStyle(fontFamily: 'en',fontSize: 20),
                                          readOnly: true,
                                          controller: _emailController,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            label: Text(
                                              'البريد الالكتروني',
                                            ),
                                          ))),

                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(style: TextStyle(fontFamily: 'en',fontSize: 20),
                                          controller: _adressController,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            label: Text(
                                              'العنوان',
                                            ),
                                          ))),

                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(style: TextStyle(fontFamily: 'en',fontSize: 20),
                                          controller: _phoneController,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            label: Text(
                                              'رقم الموبايل',
                                            ),
                                          ))),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () => bloc.updateUserData(
                                        _nameController!.value.text,
                                        _emailController!.value.text,
                                        _adressController!.value.text,
                                        _phoneController!.value.text),
                                    child: const Text('تعديل البيانات ',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'ar',),),
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(350, 50),
                                        ),
                                  )
                                ],
                              )),
                        ))

                    //
                    ),
              ),
            ),
          ),
        );
  }
}
