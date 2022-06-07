import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dress_suit/repository/product_repository.dart';
import 'package:meta/meta.dart';

import '../../model/user_product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {

  ProductCubit() : super(ProductInitial());
  ProductRepository _productRepository = ProductRepository();
  List<ProductData>count_product=[];
  List<ProductData>count_SuitProduct=[];
  List<ProductData>count_userProduct=[] ;
  void uploadProductImage(List<File>imges) async {
    await _productRepository.uploadProductImage(imges);
  }

  void saveProduct(String name, String color, String size, String price,
      String type) {
    _productRepository.saveProduct(name, color, size, price, type);
  }
  List<ProductData> viewSuitProduct()  {
    _productRepository.viewSuitProduct().
    then((data) {
      emit(GetSuitProduct(data));
      count_SuitProduct= data;
    });
    return count_SuitProduct;
  }
  List<ProductData> viewDressProduct()  {
    _productRepository.viewDressProduct().
    then((data) {
      emit(GetDressProduct(data));

      count_product= data;

    });
    return count_product;
  }
  List<ProductData> viewUserProduct()  {
    _productRepository.viewUserProduct().
    then((data) {

      emit(GetUserProduct(data));

      count_userProduct= data;

    });
    return count_userProduct;
  }
  void deletItem(String product_id) {
    _productRepository.deletItem(product_id);

  }
  void deletImage(List<String> image_url) {
    _productRepository.deletImage(image_url);


  }
}