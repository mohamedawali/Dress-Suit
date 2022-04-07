import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sign_cubit/sign_cubit.dart';
import 'signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass1 = TextEditingController();
  //TextEditingController _pass2 = TextEditingController();
  // AuthController _controller = Get.put(AuthController());
  var bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<SignCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(children: [
            Container(
              color: Colors.lightBlue,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 60),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                  hintText: 'Enter Email',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _pass1,
                              decoration: InputDecoration(
                                  hintText: 'Enter Password',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              //   controller: _pass,
                              decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                bloc.signUp(
                                    _email.value.text, _pass1.value.text);
                                Navigator.pushNamed(context, '/MainHome');
                                //  _controller.signUp(_email.value.text,_pass1.value.text);
                                // Get.to(MainHome());
                                // Signin(_email.value.text,_pass.value.text);
                              },
                              child: Text('Sign Up'),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('or'),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signin');
                                  // Get.to(SignIn());
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
