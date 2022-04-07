// import 'package:dress_suit/cubit/sign_cubit/sign_cubit.dart';
// import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var bloc;
//   @override
//   void initState() {
//    bloc= BlocProvider.of<SignCubit>(context);
//    var currentUser = bloc.getCurrentUser();
//    print(currentUser);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return
//
//
//
//     Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(tabs: [
//               Tab(
//                 text: 'فستان',
//                 icon: Icon(Icons.female),
//               ),
//               Tab(
//                 text: 'بدله',
//                 icon: Icon(Icons.male),
//               )
//             ]),
//           ),
//          body: Container( child: GridView.builder(
//                           shrinkWrap: true,
//                           physics: PageScrollPhysics(),
//                           itemCount: 10,
//                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               childAspectRatio: 2 / 3.2, crossAxisCount: 2),
//                           itemBuilder: (context, index) => Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 5, right: 5, top: 5),
//                                 child: Card(
//                                   elevation: 15,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(6),
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           color: Colors.grey,
//                                           height: 200,
//                                         ),
//                                         Text(
//                                      'فستان فستان احمر احمر سواريه سواريه جميل جدا جدا جدا نص كم مناسب للحفلات ',
//                                           maxLines: 2,
//                                           textDirection: TextDirection.rtl,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               overflow: TextOverflow.ellipsis),
//                                         ),
//                                         ElevatedButton(
//                                           onPressed: () {},
//                                           child: Text('عرض'),
//                                           style: ElevatedButton.styleFrom(
//                                               minimumSize: Size(100, 30)),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )),
//     )
//
//
//     );
//
//
//   }
//
// }
//
//       Column(
//             children: [
//               Container(
//                   child: Row(
//                 children: [
//                   Expanded(
//                       flex: 1,
//                       child: TextButton(
//                           onPressed: () {},
//                           child: Text('بدل',
//                               style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 fontSize: 20,
//                               )))),
//                   Expanded(
//                       flex: 1,
//                       child: TextButton(
//                           onPressed: () {},
//                           child: Text('فساتين',
//                               style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ))))
//                 ],
//               )),
//             Container(
//                     color: Colors.orange,
//
//                       child: GridView.builder(
//                           shrinkWrap: true,
//                           physics: PageScrollPhysics(),
//                           itemCount: 10,
//                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               childAspectRatio: 2 / 3.2, crossAxisCount: 2),
//                           itemBuilder: (context, index) => Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 5, right: 5, top: 5),
//                                 child: Card(
//                                   elevation: 15,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(6),
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           color: Colors.grey,
//                                           height: 200,
//                                         ),
//                                         Text(
//                                           'فستان فستان احمر احمر سواريه سواريه جميل جدا جدا جدا نص كم مناسب للحفلات ',
//                                           maxLines: 2,
//                                           textDirection: TextDirection.rtl,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               overflow: TextOverflow.ellipsis),
//                                         ),
//                                         ElevatedButton(
//                                           onPressed: () {},
//                                           child: Text('عرض'),
//                                           style: ElevatedButton.styleFrom(
//                                               minimumSize: Size(100, 30)),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )),
//                     )),
//
//             ],
//           ),
//
//
//
//       // ),
//     );
//   }
// }
