import 'dart:io';

import 'package:dress_suit/model/user_product.dart';
import 'package:dress_suit/web_services/products_service.dart';
import 'package:dress_suit/web_services/user_service.dart';

import '../model/getDate.dart';
import '../model/user_data.dart';

class ProductRepository{
  ProductService _productService=ProductService();
  UsersService _usersService=UsersService();
  GetDate getDate = GetDate();
  List<String> url_image = [];

  void saveProduct(String name, String color, String size, String price, String type) async {
  //  print('uriss${l}');
   // var uid = FirebaseAuth.instance.currentUser!.uid;
    var data = await _usersService.viewUserData();

    var phone = UserData.fromMap(data!).phone;


 ProductData   productData = ProductData('', '', name, color, size, price, type,
        url_image.toList(), getDate.getDate(), phone);

    _productService.saveProduct(productData);
    url_image.clear();

  }

  //
  Future<List<ProductData>> viewDressProduct() async {
    final listDress = await _productService.viewDressProduct();
    var list_Dress = listDress
        .map((value) => ProductData.productFromMap(value.data()))
        .toList();

    return list_Dress;
  }

  Future<List<ProductData>> viewSuitProduct() async {
    final listSuit = await _productService.viewSuitProduct();
    var list_Suit = listSuit
        .map((value) => ProductData.productFromMap(value.data()))
        .toList();

    return list_Suit;
  }

  Future<List<ProductData>> viewUserProduct() async {
    final docs = await _productService.viewUserProduct();
//   var v= (Map<String, dynamic>.from((listUserProduct) as dynamic));
    var list_UserProduct = docs
        .map((value) => ProductData.productUserFromMap(value.data()))
        .toList();
    return list_UserProduct;
  }

  void deletItem(String product_id) {
    _productService.deletItem(product_id);
  }
  void deletImage(List<String> image_url) {
    _productService.deletImage(image_url);

  }
  Future<List<String>> uploadProductImage(List<File> images) async {
    images.forEach((image) async {
      var url = await _productService.uploadProductImage(image);
      url_image.add(url);

    });

    return url_image;
   ;
  }
}