import 'package:dress_suit/View/edit_profil.dart';
import 'package:dress_suit/View/mainHome.dart';
import 'package:dress_suit/View/make_profil.dart';
import 'package:dress_suit/View/resetPassword.dart';
import 'package:dress_suit/View/splash_screen.dart';
import 'package:dress_suit/View/viewProduct.dart';
import 'package:dress_suit/cubit/mainHome_cubit/main_home_cubit.dart';
import 'package:dress_suit/cubit/product_cubit/product_cubit.dart';
import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:dress_suit/dependanceIngection.dart';
import 'package:dress_suit/model/user_data.dart';
import 'package:dress_suit/model/user_product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../View/user_Profil.dart';
import '../View/signin.dart';
import '../View/signup.dart';

import '../cubit/sign_cubit/sign_cubit.dart';

class AppNavigate {
 AppNavigate(){
   initGit();
 }
  Route? navigator(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>  BlocProvider<SignCubit>.value(
    value: getIt<SignCubit>(),
    child: const Splash()));

      case '/signin':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SignCubit>.value(
                  value: getIt<SignCubit>(),
                  child: const SignIn(),
                ));
      case '/makeProfil':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<UserCubit>.value(
                value: getIt<UserCubit>(), child: MakeProfile()));
      case '/signup':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SignCubit>.value(
                value: getIt<SignCubit>(), child: const SignUp()));

      case '/MainHome':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<UserCubit>.value(value: getIt<UserCubit>()),
                  BlocProvider<ProductCubit>.value(value: getIt<ProductCubit>()),
                  BlocProvider<SignCubit>.value(value: getIt<SignCubit>()),
                  BlocProvider<MainHomeCubit>(
                    create: (context) => MainHomeCubit(),
                  )
                ], child: const MainHome()));
      case '/userProfil':
        var _userData = routeSettings.arguments as UserData;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<UserCubit>.value(
                value: getIt<UserCubit>(), child: UserProfile(userData: _userData)));
      case '/editProfil':
        var _userData = routeSettings.arguments as UserData;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<UserCubit>.value(
                value: getIt<UserCubit>(), child: EditProfile(userData: _userData)));

      case '/viewProduct':
        var allProduct = routeSettings.arguments as ProductData;

        return MaterialPageRoute(
            builder: (_) => BlocProvider<UserCubit>.value(
                value: getIt<UserCubit>(), child: ViewProduct(allProduct: allProduct)));

      case '/from_splash_to_sign':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SignCubit>.value(
                  value: getIt<SignCubit>(),
                  child: const SignIn(),
                ));

      case '/reset_password':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SignCubit>.value(
                  value: getIt<SignCubit>(),
                  child: const ResetPassword(),
                ));
    }
  }
} //
