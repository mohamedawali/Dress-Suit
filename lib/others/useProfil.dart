// import 'package:dress_suit/View/user_Profil.dart';
// import 'package:dress_suit/connection/user_service.dart';
// import 'package:dress_suit/cubit/sign_cubit/sign_cubit.dart';
// import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
// import 'package:dress_suit/model/user_data.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
//
// import '../repository/repository.dart';
//
// class UserProfil extends StatefulWidget {
//   const UserProfil({Key? key}) : super(key: key);
//
//   @override
//   State<UserProfil> createState() => _UserProfilState();
// }
//
// class _UserProfilState extends State<UserProfil> {
//   var bloc;
//   @override
//   void initState() {
//   bloc=  BlocProvider.of<UserCubit>(context);
//      bloc   .viewUserData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         body: SafeArea(
//             child: Container(
//                 color: Colors.blueAccent,
//                 child: Stack(children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 150, 20, 30),
//                     child: Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(50))),
//                       child: Padding(
//                           padding: const EdgeInsets.only(top: 50),
//                           child: Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 20, right: 20),
//                               child: BlocBuilder<UserCubit, UserState>(
//                                   builder: (context, state){ if(state is getDataUser) {
//                                     return    Column(children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         state.userData.name!,
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20),
//                                       )
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 40,
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Text('Email',
//                                           style: TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 20)),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Text(state.userData.email! ,
//                                           style: const TextStyle(
//                                              fontWeight: FontWeight.bold,
//                                               fontSize: 16))
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Text('Phone',
//                                           style: TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 20)),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Text(state.userData.phone!,
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                               fontSize: 16)),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Text('Adress',
//                                           style: TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 20)),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       Text(state.userData.adress!,
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                               fontSize: 16)),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 50,
//                                   ),
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       // Get.to(EditProfil());
//                                       Navigator.pushNamed(
//                                           context, '/editProfil');
//                                     },
//                                     child: const Text('Edit Profil',
//                                         style: TextStyle(fontSize: 20)),
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                       onPrimary: Colors.blueAccent,
//                                       minimumSize: const Size(300, 40),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50),
//                                           side: const BorderSide(
//                                               color: Colors.blueAccent,
//                                               width: 3)),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       bloc.logOut();
//
//                                       Navigator.popAndPushNamed(context, '/signin');
//                                     },
//                                     child: const Text('LogOut',
//                                         style: TextStyle(fontSize: 20)),
//                                     style: ElevatedButton.styleFrom(
//                                         primary: Colors.white,
//                                         onPrimary: Colors.blueAccent,
//                                         minimumSize: const Size(300, 40),
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(50),
//                                             side: const BorderSide(
//                                                 color: Colors.blueAccent,
//                                                 width: 3))),
//                                   )
//                                 ]);
//                                   }return const Text('No Data');
//                               }))),
//                     ),
//                   )
//                 ]))));
//   }
// }
// //////////////////////////////////////////////////////////////
// //Positioned(
// //   top: 50,
// //   left: 130,
// //   right: 130,
// //   child: CircleAvatar(
// //     backgroundColor: Colors.white,
// //     maxRadius: 70,
// //     child: CircleAvatar(
// //      // backgroundImage:NetworkImage(state.userData!.image!.isNotEmpty ?state.userData!.image!:'null') ,
// //       //NetworkImage(state.userData!.image!.isEmpty ?? null : state.userData!.image!),
// //       maxRadius: 65,
// //     ),
// //   ),
