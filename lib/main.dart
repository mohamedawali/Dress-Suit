

import 'package:dress_suit/route/navigator.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';


void main()async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp( MyApp(appNavigate: AppNavigate()));
}

class MyApp extends StatelessWidget {
 final AppNavigate? appNavigate;
const   MyApp({Key? key,required this.appNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.lightBlue));
    return  MaterialApp(
   debugShowCheckedModeBanner: false,
      onGenerateRoute:appNavigate!.navigator ,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,


      ),


    );
  }
}

