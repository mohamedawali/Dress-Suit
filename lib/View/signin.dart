import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubit/sign_cubit/sign_cubit.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass1 = TextEditingController();
  GlobalKey<FormState> _signInGlobalKey = GlobalKey<FormState>();
  var bloc;
  bool isvisable=true ;
  UserCredential? _userCredential;




  @override
  void initState() {
    bloc = BlocProvider.of<SignCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  bloc=BlocProvider.of<SignCubit>(context);
    return Scaffold(
      body:

        Container(
          child: Stack(children: [
            Container(
              color: Colors.lightBlue,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: SingleChildScrollView(
                  child:
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 100),


                          child: Form(
                            key: _signInGlobalKey,
                            child: Column(
                              children: [
                                TextFormField
                                  (
                                  style: TextStyle(fontFamily: 'en',fontSize: 20),
                                  validator: (email) => checkEmail(email),
                                  //email!.isEmpty?'ادخل البريد الالكتروني':null,
                                  controller: _email,
                                  decoration: const InputDecoration(
                                      hintTextDirection: TextDirection.rtl,
                                      hintText: 'ادخل البريد الالكتروني',
                                      border: OutlineInputBorder()),
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField
                                (style: TextStyle(fontFamily: 'en',fontSize: 20),obscureText: isvisable,
                                validator: (password) => checkPassword(password),
                                //  password!.isEmpty?'ادخل الرقم السري':null,
                                controller: _pass1,
                                decoration:  InputDecoration(suffixIcon:InkWell(onTap: visable,child: Icon( Icons.visibility)),
                                    hintTextDirection: TextDirection.rtl,
                                    hintText: 'ادخل الرقم السري',
                                    border: OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {
Navigator.pushNamed(context, '/reset_password');
                                      },
                                      child: const Text('هل نسيت كلمة السر؟',
                                          style: TextStyle(fontSize: 16,fontFamily: 'ar',)))),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () =>signIn(),
                                child: const Text('تسجيل دخول',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'ar'),),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(300, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                '&',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signup');
                                    // Navigator.pushNamed(context, '/makeProfil');
                                    // push(context, MaterialPageRoute(builder: (context)=>SignUp()));

                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                                    // Get.to(SignIn());
                                  },
                                  child: const Text(
                                    'إنشاء حساب ',
                                    style: TextStyle(fontFamily: 'ar',
                                        fontWeight: FontWeight.bold, fontSize: 20),
                                  ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),



            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/logo/screenLogo2.png',
                height: 150,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ]),
        ),
     // ),
    );
  }
  signIn()async {
   if (_signInGlobalKey.currentState!.validate()) {
 _userCredential= await  bloc.signIn(
         _email.value.text, _pass1.value.text);


      if(_userCredential !=null){
       Navigator.pushReplacementNamed(
                 context, '/MainHome');
           }else{
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.lightBlue,content: Text('البريد الالكتروني غير موجود !',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18,fontFamily: 'ar'),),duration: Duration(seconds: 2),));
     }



   }

 }
  checkEmail(String? email) {
    EmailValidator.validate(email!)
        ? null
        : 'ادخل البريد الاكتروني بطريقة صحيحة(example@gmail.com)';
  }

  checkPassword(String? password) {
    return password!.isEmpty ? 'ادخل الرقم السري' : null;
  }

 void visable() {

     setState(() {
       isvisable = !isvisable;
     });
    }


}
