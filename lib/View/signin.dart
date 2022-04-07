

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
  var bloc;
 // AuthController _controller = Get.put(AuthController());
var uid;
 // FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
//   @override
//    void initState() {
//      uid = _firebaseAuth.currentUser!.uid;
//  if(uid!=null){
//   Navigator.pushNamed(context, '/MainHome');
// // // }else{  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
//  }
//     super.initState();
//    }
  var currentUser;
  @override
  void initState() {
 bloc=   BlocProvider.of<SignCubit>(context);


 //      currentUser = bloc.getCurrentUser();
 // print(currentUser);
// if(currentUser != null)
//
//  Navigator.pushNamed(context, '/MainHome');
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
  //  bloc=BlocProvider.of<SignCubit>(context);
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

                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                               // _controller.signIn(_email.value.text,_pass1.value.text);
                               bloc.signIn(_email.value.text,_pass1.value.text);
                                Navigator.pushNamed(context, '/MainHome');
                                // Get.to(MainHome());

                              },
                              child: Text('Sign In'),
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
                                   Navigator.pushNamed(context, '/signup');

                                  // push(context, MaterialPageRoute(builder: (context)=>SignUp()));

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                                 // Get.to(SignIn());
                                },
                                child: Text(
                                  'Sign Up',
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
