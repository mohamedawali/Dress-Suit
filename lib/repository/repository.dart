import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_suit/View/signup.dart';

import 'package:dress_suit/model/getDate.dart';
import 'package:dress_suit/model/user_data.dart';
import 'package:dress_suit/model/user_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Repository {
//   Users users = Users();
//   SignFire signFire = SignFire();
//   Product product = Product();
//   ProductData? productData;
//   var url;
//   var phoneNumber;
//   var userPhoneNumber;
//   List<String> l = [];
//   List<String> urlUpload = [];
//   var currentUserId;
//   GetDate getDate = GetDate();
//
//
// // void getImageUrl(){
// //   print('repo${signFire.url.toString()}');
// //   //  signFire.url.toString();
// // }
//   void saveUserData(String name, String phone, String adress) async {
//     var email = users.getCurrentUserEmail();
//
//     UserData userData = UserData(name, email, adress, phone);
//
//     users.saveUserData(userData);
//   }
//
//   Future<UserData> viewUserData() async {
//     var user_data = await users.viewUserData();
//     print(user_data);
//
//     return UserData.fromMap(user_data!);
//   }
//
//   void updateUserData(String name, String email, String adress, String phone) {
//     UserData userData = UserData(name, email, adress, phone);
//
//     users.updateUserData(userData.tomap());
//   }

  // Future getCurrentEmail() async {
  //   var currentEmail = await signFire.getCurrentEmail();
  //   print(currentEmail);
  //   return await signFire.getCurrentEmail();
  // }
  //
  // void getUserPhoneNumber() async {
  //   var data = await users.viewUserData();
  //   print(data);
  //
  //   userPhoneNumber = UserData.fromMap(data!).phone;
  // }

//   void saveProduct(
//       String name, String color, String size, String price, String type) async {
//     print('uriss${l}');
//     var uid = FirebaseAuth.instance.currentUser!.uid;
//     var data = await users.viewUserData();
//
//     var phone = UserData.fromMap(data!).phone;
//     print(phone);
//
//     productData = ProductData('', uid, name, color, size, price, type,
//         l.toList(), getDate.getDate(), phone);
//
//     product.saveProduct(productData!);
//     l.clear();
//     l;
//   }
//
//   //
//   Future<List<ProductData>> viewDressProduct() async {
//     final listDress = await product.viewDressProduct();
//     var list_Dress = listDress
//         .map((value) => ProductData.productFromMap(value.data()))
//         .toList();
//
//     return list_Dress;
//   }
//
//   Future<List<ProductData>> viewSuitProduct() async {
//     final listSuit = await product.viewSuitProduct();
//     var list_Suit = listSuit
//         .map((value) => ProductData.productFromMap(value.data()))
//         .toList();
//     print('the map${list_Suit}');
//     return list_Suit;
//   }
//
//   Future<List<ProductData>> viewUserProduct() async {
//     final docs = await product.viewUserProduct();
// //   var v= (Map<String, dynamic>.from((listUserProduct) as dynamic));
//     var list_UserProduct = docs
//         .map((value) => ProductData.productUserFromMap(value.data()))
//         .toList();
//     return list_UserProduct;
//   }
//
//   void deletItem(String product_id) {
//     product.deletItem(product_id);
//   }
//   void deletImage(List<String> image_url) {
//     product.deletImage(image_url);
//
//   }
  //
  // Future<List<String>> uploadProductImage(List<File>imges)async {
  //
  //    urlUpload =await product.uploadProductImage(imges);
  //
  //    print('thefinal${urlUpload.toString()}');
  //    return urlUpload;
  // }

  // Future<List<String>> uploadProductImage(List<File> images) async {
  //   images.forEach((element) async {
  //     var x = await product.uploadProductImage(element);
  //     l.add(x);
  //     print('xxxxxxxxx${l.toList()}');
  //   });
  //   //   await
  //   return l;
  //   // print(imageUrls);
  //   // return  imageUrls;
  // }
  //
  // void getImage() {
  //   print(urlUpload.toString());
  // }


// void getuserImage(){
//  url= users!.url;
// }
}
