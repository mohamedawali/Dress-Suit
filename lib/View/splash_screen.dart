import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dress_suit/cubit/sign_cubit/sign_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  StreamSubscription<ConnectivityResult>? _streamSubscription;
  ConnectivityResult? _connectivityResult;

  @override
  void initState() {

// print(currentUserId);
    _streamSubscription = Connectivity().onConnectivityChanged.listen((result) {
      //showDialog(context: context, builder: (context)=>const Center(child:CircularProgressIndicator()));
      setState(() {
        _connectivityResult = result;

        checkInternet();
      });
    });

    checkInternet();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      //SafeArea(child:
      Container(color: Colors.white,
        child: Center(
          child: Image.asset('assets/logo/splashLogo.png'),
       // ),
      )  ),
    );
  }

  v() async {
    await Future.delayed(const Duration(seconds: 5));
var currentUserId = BlocProvider.of<SignCubit>(context).getCurrentUserId();
   if (currentUserId !=null){

      Navigator.pushReplacementNamed(context, '/MainHome');
  }else{
     Navigator.pushReplacementNamed(context, '/from_splash_to_sign');
  }
}

  checkInternet() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      v();
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text(
                  '! حدث خطأ',
                  textAlign: TextAlign.end,
                ),
                content: Text(
                  'تم فقد الاتصال بالانترنت',
                  textAlign: TextAlign.end,
                ),
              ));
    }
    setState(() {
      _connectivityResult = connectivityResult;
    });
  }
}
