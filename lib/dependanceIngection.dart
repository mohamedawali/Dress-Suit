import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_suit/cubit/product_cubit/product_cubit.dart';
import 'package:dress_suit/cubit/sign_cubit/sign_cubit.dart';
import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:dress_suit/repository/auth_repository.dart';
import 'package:dress_suit/repository/product_repository.dart';
import 'package:dress_suit/repository/user_repository.dart';
import 'package:dress_suit/web_services/auth_service.dart';
import 'package:dress_suit/web_services/products_service.dart';
import 'package:dress_suit/web_services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.I;

initGit(){
  getIt.registerLazySingleton<ProductCubit>(() => ProductCubit(getIt()));
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepository(getIt(),getIt()));
  getIt.registerLazySingleton<ProductService>(() => ProductService(FirebaseStorage.instance,FirebaseFirestore.instance,FirebaseAuth.instance));



  getIt.registerLazySingleton<SignCubit>(() => SignCubit(getIt(),getIt()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));
  getIt.registerLazySingleton<AuthService>(() => AuthService(FirebaseAuth.instance));

  getIt.registerLazySingleton<UserCubit>(() => UserCubit(getIt()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt()));
  getIt.registerLazySingleton<UsersService>(() => UsersService(FirebaseAuth.instance,FirebaseFirestore.instance));

}