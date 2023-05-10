import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:dress_suit/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatelessWidget {
  UserData userData;
  EditProfile({Key? key,required this.userData}) : super(key: key);
  var bloc;
  TextEditingController? _nameController;

  TextEditingController? _emailController;
  TextEditingController? _addressController;
  TextEditingController? _phoneController;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<UserCubit>(context);
    _nameController = TextEditingController(text:userData.name);
    _emailController = TextEditingController(text: userData.email);
    _addressController = TextEditingController(text: userData.adress);
    _phoneController = TextEditingController(text: userData.phone);

    return Scaffold(
        appBar: AppBar(title:  const Text('تعديل البيانات الشخصية'),centerTitle: true,foregroundColor: Colors.white,titleTextStyle: const TextStyle(fontFamily: 'ar',fontSize: 20),),
        body:  Container(
            color: Colors.grey[200],
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),

              child: Center(
                    child:
                    SingleChildScrollView(
                        child:Container(
                        height: 430,
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
                        child: Form(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 14, left: 14, top: 13, bottom: 13),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(style: const TextStyle(fontFamily: 'en',fontSize: 20),
                                          controller: _nameController,
                                          textAlign: TextAlign.left,
                                          decoration: const InputDecoration(
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
                                      child: TextFormField(style: const TextStyle(fontFamily: 'en',fontSize: 20),
                                          readOnly: true,
                                          controller: _emailController,
                                          textAlign: TextAlign.left,
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'البريد الالكتروني',
                                            ),
                                          ))),

                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(style: const TextStyle(fontFamily: 'en',fontSize: 20),
                                          controller: _addressController,
                                          textAlign: TextAlign.left,
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'العنوان',
                                            ),
                                          ))),

                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(style: const TextStyle(fontFamily: 'en',fontSize: 20),
                                          controller: _phoneController,
                                          textAlign: TextAlign.left,
                                          decoration: const InputDecoration(
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
                                        _addressController!.value.text,
                                        _phoneController!.value.text),
                                    child: const Text('تعديل البيانات ',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'ar',),),
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(350, 50),
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
