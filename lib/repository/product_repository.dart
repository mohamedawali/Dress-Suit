import 'dart:io';

import 'package:dress_suit/model/user_product.dart';
import 'package:dress_suit/web_services/products_service.dart';
import 'package:dress_suit/web_services/user_service.dart';

import '../model/getDate.dart';
import '../model/user_data.dart';

class ProductRepository{
  final ProductService _productService;
  final UsersService _usersService;

  ProductRepository(this._productService, this._usersService);

  GetDate getDate = GetDate();
  List<String> urlImage = [];

   saveProduct(String name, String color, String size, String price, String type) async {

    var data = await _usersService.viewUserData();

    var phone = UserData.fromMap(data!).phone;


 ProductData   productData = ProductData('', '', name, color, size, price, type,
        urlImage.toList(), getDate.getDate(), phone);

    _productService.saveProduct(productData);
    urlImage.clear();

  }

  //
  Future<List<ProductData>> viewDressProduct() async {
    final dressList = await _productService.viewDressProduct();
    var listDress = dressList
        .map((value) => ProductData.productFromMap(value.data()))
        .toList();

    return listDress;
  }

  Future<List<ProductData>> viewSuitProduct() async {
    final suitList = await _productService.viewSuitProduct();
    var listSuit = suitList
        .map((value) => ProductData.productFromMap(value.data()))
        .toList();

    return listSuit;
  }

  Future<List<ProductData>> viewUserProduct() async {
    final docs = await _productService.viewUserProduct();
    var listUserProduct = docs
        .map((value) => ProductData.productUserFromMap(value.data()))
        .toList();
    return listUserProduct;
  }

  Future deleteItem(String productId)async {
  await  _productService.deleteItem(productId);
  }
  void deleteImage(List<String> imageUrl) {
    _productService.deleteImage(imageUrl);

  }
  Future<List<String>> uploadProductImage(List<File> images) async {
    images.map((image) async {
      var url = await _productService.uploadProductImage(image);
      urlImage.add(url);

    });

    return urlImage;

  }
}