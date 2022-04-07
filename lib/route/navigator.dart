

import 'package:dress_suit/View/home1.dart';
import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../View/editProfil.dart';
import '../View/signin.dart';
import '../View/signup.dart';

import '../cubit/sign_cubit/sign_cubit.dart';

class AppNavigate {
  Route? navigator(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext context) => SignCubit(),
              child: SignIn(),
            ));
      // case '/signin':
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (BuildContext context) => SignCubit(),
      //             child: SignIn(),
      //           ));
      case '/signup':
        return MaterialPageRoute(builder: (_)=>BlocProvider(create: (BuildContext context)=>SignCubit(),child:SignUp() ));
      case '/MainHome':
        return MaterialPageRoute(builder: (context)=>MainHome());
      case '/editProfil':
        return MaterialPageRoute(builder: (_)=>BlocProvider(create: (BuildContext context)=>UserCubit(),child: EditProfil(),));
    }
  }
}
