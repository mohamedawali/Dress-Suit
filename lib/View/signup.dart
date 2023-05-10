import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/sign_cubit/sign_cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass1 = TextEditingController();
  final TextEditingController _pass2 = TextEditingController();

  final GlobalKey<FormState> _signUpgGlobalKey = GlobalKey<FormState>();
  var bloc;
  bool isVisable1 = true;
  bool isVisable2 = true;
  UserCredential? _userCredential;
  @override
  void initState() {
    bloc = BlocProvider.of<SignCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.lightBlue,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 100),
                  child: Form(
                    key: _signUpgGlobalKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(fontFamily: 'en', fontSize: 20),
                          validator: (email) => checkEmail(email),
                          controller: _email,
                          decoration: const InputDecoration(
                              hintText: 'ادخل البريد الالكتروني',
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(fontFamily: 'en', fontSize: 20),
                          obscureText: isVisable1,
                          validator: (pass1) => checkPassword(pass1),
                          controller: _pass1,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: visable1,
                                  child: const Icon(Icons.visibility)),
                              hintText: 'ادخل الرقم السري',
                              hintTextDirection: TextDirection.rtl,
                              border: const OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(fontFamily: 'en', fontSize: 20),
                          obscureText: isVisable2,
                          validator: (pass2) {

                            setState(() {
                              confirmPassword(pass2, _pass1);
                            });
                             },
                          controller: _pass2,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: visable2,
                                  child: const Icon(Icons.visibility)),
                              hintText: 'تاكيدالرقم السري',
                              hintTextDirection: TextDirection.rtl,
                              border: const OutlineInputBorder()),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => signUp(),
                          child: const Text('إنشاء حساب',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'ar')),
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
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/signin', (Route rout) => false);
                            },
                            child: const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  fontFamily: 'ar',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                  ),
                ),
              )),
        ),
        Positioned(
          child: Image.asset('assets/logo/screenLogo2.png',
              height: 150, width: MediaQuery.of(context).size.width),
          top: 30,
        )
      ]),
    );
  }


  checkEmail(String? email) {
    return EmailValidator.validate(email!)
        ? null
        : 'ادخل البريد الاكتروني بطريقة صحيحة(example@gmail.com)';
  }

  checkPassword(String? pass2) {
    if (pass2!.isEmpty) {
      return 'ادخل الرقم السري';
    }
    if (pass2.length < 6) {
      return 'يجب ان يكون الرقم السري مكون من 6 ارقام او اكثر';
    }

    return null;
  }

  confirmPassword(String? pass2, TextEditingController pass1) {
    if (pass2!.isEmpty) {
      return 'ادخل الرقم السري';
    }
    if (pass2.length < 6) {
      return 'يجب ان يكون الرقم السري مكون من 6 ارقام او اكثر';
    }



    if (pass2 != pass1.text) {
      return 'الرقم السري غير متطابق';
    }

    return null;
  }

  signUp() async {
    if (_signUpgGlobalKey.currentState!.validate()) {
      _userCredential = await bloc.signUp(_email.value.text, _pass2.value.text);
      print('signup${_userCredential}');
      if (_userCredential == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.lightBlue,
            content: Text(
              'تم التسجيل بالبريد اللكتروني من قبل ',style: TextStyle(fontFamily: 'ar',fontSize: 18),
              textDirection: TextDirection.rtl,
            ),
            duration: Duration(seconds: 3)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.lightBlue,
            content: Text(
              'تم التسجيل بنجاح',style:TextStyle(fontFamily: 'ar',fontSize: 18) ,
              textDirection: TextDirection.rtl,
            ),
            duration: Duration(seconds: 3)));

        Navigator.pushReplacementNamed(context, '/makeProfil');
      }
    }
  }

  void visable1() {
    setState(() {
      isVisable1 = !isVisable1;
    });
  }

  void visable2() {
    setState(() {
      isVisable2 = !isVisable2;
    });
  }
}
