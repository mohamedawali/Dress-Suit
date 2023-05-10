import 'package:dress_suit/cubit/sign_cubit/sign_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
final TextEditingController _email=TextEditingController();
final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
var bloc;
@override
  void initState() {
bloc= BlocProvider.of<SignCubit>(context);
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.white,),
      body: Container(color: Colors.grey[200],height: double.infinity,
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
         child: Center(
           child: Container(decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8),boxShadow: const [
       BoxShadow(
      offset: Offset(0, 0),
        blurRadius: 1,
    //    // spreadRadius: 1,
        color: Colors.black26,
      )], ),
             height: 300,
            child: Form(key: _globalKey,

                 child: Padding(
                    padding: const EdgeInsets.only(right: 10,left: 10),
                    child:
                    Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                      TextFormField(controller: _email,
                        validator: (value)=>EmailValidator.validate(value!)?null:'ادخل اابريد الالكتروني بشكل صحيح(example@gmail.com)',
                        decoration: const InputDecoration(
                            hintText: 'ادخل البريد الالكتروني لاسترجاع كلمة السر ',
                            hintStyle: const TextStyle(fontSize: 12,fontFamily: 'ar'),
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(onPressed: ()  async {

              if(_globalKey.currentState!.validate()){

                    bloc.   resetPassword(_email.value.text);
                    showDialog(context: context, builder: (context)=>AlertDialog(content: Text(' تم ارسال رابط تغير كلمة السر الي البريد الالكتروني ${_email.value.text}',style: const TextStyle(fontFamily: 'ar'),textDirection: TextDirection.rtl,),));
                    await Future.delayed(const Duration(seconds: 1));
                    Navigator.pushNamedAndRemoveUntil(context, '/signin',(Route r)=>false);
              }else{
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: const Text('ادخل البريد الالكتروني لاسترجاع كلمة السر',style: TextStyle(fontFamily: 'ar',fontSize: 18),textDirection: TextDirection.rtl,),backgroundColor: Colors.lightBlue,duration: Duration(seconds: 1),));
              }
                      }, child: const Text('استرجاع كلمة السر',style: const TextStyle(fontSize: 16,fontFamily: 'ar',color: Colors.white),))
              ],
            ),
                    ),
          ),
        ),
              ),
      )
      )
    );
  }

}
