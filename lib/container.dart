// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'cubit/user_cubit/user_cubit.dart';
// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//  // var bloc;
//   @override
//   void initState() {
//     BlocProvider.of<UserCubit>( context);
//         //.getEmail();
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child:  BlocBuilder<UserCubit, UserState>(
//       builder: (context, state) {
//         if(state is Loademail) {
//
//           return Text(
//             state.email
//             //bloc!.email
//             ,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: 20),
//           );
//         }else return Text('failed'); },
//     ));
//   }
// }
