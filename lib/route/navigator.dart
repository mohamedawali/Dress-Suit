



import 'package:dress_suit/View/edit_profil.dart';
import 'package:dress_suit/View/home1.dart';
import 'package:dress_suit/View/make_profil.dart';
import 'package:dress_suit/View/resetPassword.dart';
import 'package:dress_suit/View/splash_screen.dart';
import 'package:dress_suit/View/viewProduct.dart';
import 'package:dress_suit/cubit/product_cubit/product_cubit.dart';
import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:dress_suit/model/user_data.dart';
import 'package:dress_suit/model/user_product.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../View/user_Profil.dart';
import '../View/signin.dart';
import '../View/signup.dart';

import '../cubit/sign_cubit/sign_cubit.dart';


class AppNavigate {
UserCubit userCubit=UserCubit();
SignCubit signCubit=SignCubit();
ProductCubit productCubit=ProductCubit();
  Route? navigator(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
           builder:
                (_) => BlocProvider<SignCubit>.value(
           value: signCubit,
              child: Splash(),
            )
         );

      case '/signin':
        return  MaterialPageRoute(
          //  builder:(BuildContext context) =>const SignIn());
            builder: (_) => BlocProvider<SignCubit>.value(
           value: signCubit,
              child: const SignIn(),
            ));
      case '/makeProfil':
        //return  MaterialPageRoute(builder: (_)=>BlocProvider(create: (BuildContext context)=>UserCubit(),child:const MakeProfil() ));
       return MaterialPageRoute(builder: (_)=>BlocProvider<UserCubit>.value(value: userCubit,child: MakeProfil()));
      case '/signup':
        return MaterialPageRoute(builder: (_)=>BlocProvider<SignCubit>.value(value: signCubit,child:const SignUp() ));

      case '/MainHome':
       //return MaterialPageRoute(builder: (_)=>BlocProvider(create:(BuildContext context)=>UserCubit(),child: const MainHome()));
       // return MaterialPageRoute(builder: (_)=>BlocProvider<UserCubit>.value(value: userCubit,child:const MainHome() ));
        return MaterialPageRoute(builder: (_)=>MultiBlocProvider(providers: [BlocProvider<UserCubit>.value(value: userCubit),BlocProvider<ProductCubit>.value(value: productCubit),BlocProvider<SignCubit>.value(value: signCubit)], child: MainHome()));
      case '/userProfil':
var _userData = routeSettings.arguments as UserData ;
   //  return MaterialPageRoute(builder: (_)=>BlocProvider(create: (BuildContext context)=>UserCubit(),child:  User_Profil(userData:arg),));
return MaterialPageRoute(builder: (_)=>BlocProvider<UserCubit>.value(value: userCubit,child:  User_Profil(userData:_userData) ));
     case '/editProfil':
var _userData = routeSettings.arguments as UserData;
   // return MaterialPageRoute(builder: (_)=>BlocProvider(create: (BuildContext context)=>UserCubit(),child:  Edit_Profil(z:y),));
return MaterialPageRoute(builder: (_)=>BlocProvider<UserCubit>.value(value: userCubit,child:  Edit_Profil(userData:_userData)));

      case '/viewProduct':
        var allproduct = routeSettings.arguments as ProductData;

    // return MaterialPageRoute(builder: (_)=>BlocProvider(create: (BuildContext context)=>UserCubit(),child: ViewProduct(allproduct: allproduct),));
          //MaterialPageRoute(builder: (context)=>ViewProduct(allproduct: allproduct));
        return MaterialPageRoute(builder: (_)=>BlocProvider<UserCubit>.value(value: userCubit,child:  ViewProduct(allproduct: allproduct) ));

      case '/from_splash_to_sign':
        return MaterialPageRoute(
                  builder: (_) => BlocProvider<SignCubit>.value(
                      value: signCubit,
                        child: const SignIn(),
                      ));
       // return MaterialPageRoute(builder: (BuildContext context)=>SignIn());
    //MaterialPageRoute(builder: (context)=>ViewProduct(allproduct: allproduct));

      case '/reset_password':
        return   MaterialPageRoute(builder: (_)=>BlocProvider<SignCubit>.value(value: signCubit,child: const ResetPassword(),));
    }
  }
}//
