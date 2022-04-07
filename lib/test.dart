// import 'package:flutter/material.dart';
//
// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Stack(children: [
//             Container(
//               color: Colors.lightBlue,
//             ),
//             Padding(
//                 padding: const EdgeInsets.only(top: 180),
//                 child: Container(
//                     height: MediaQuery.of(context).size.height,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(40),
//                             topLeft: Radius.circular(40))),
//                     child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
//                         child: Form(
//                           child: Column(children: [
//                             TextFormField(
//                              // controller: _email,
//                               decoration: InputDecoration(
//                                   hintText: 'Enter Email',
//                                   border: OutlineInputBorder()),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                              // controller: _pass1,
//                               decoration: InputDecoration(
//                                   hintText: 'Enter Password',
//                                   border: OutlineInputBorder()),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),TextFormField(
//                               //   controller: _pass,
//                               decoration: InputDecoration(
//                                   hintText: 'Confirm Password',
//                                   border: OutlineInputBorder()),
//                             ),SizedBox(
//                                 height: 20),
//
//                             ElevatedButton(
//                               onPressed: () {
//                                 // _controller.signUp(_email.value.text,_pass1.value.text);
//                                 // Get.to(MainHome());
//                                 // Signin(_email.value.text,_pass.value.text);
//                               },
//                               child: Text('Sign Up'),
//                               style: ElevatedButton.styleFrom(
//                                   minimumSize: Size(300, 50),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text('or'),
//                             TextButton(
//                                 onPressed: () {
//                                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
//                                 //  Get.to(SignIn());
//                                 },
//                                 child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))
//                           ],
//                           ),
//                         ),
//                       ),
//                     )),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
