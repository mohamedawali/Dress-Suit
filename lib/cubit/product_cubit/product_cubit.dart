import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dress_suit/repository/product_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../model/user_product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit(this._productRepository) : super(ProductInitial());

  List<ProductData>countProduct=[];
  List<ProductData>countSuitProduct=[];
  List<ProductData>countUserProduct=[] ;
  List <File>imageList= [];
  File? _image1;
  File? _image2;
  File? _image3;
  void uploadProductImage(List<File>imges) async {
    await _productRepository.uploadProductImage(imges);
  }

   saveProduct(String name, String color, String size, String price,
      String type)async {
await    _productRepository.saveProduct(name, color, size, price, type);
emit(SaveProductState());
  }
 List<ProductData> viewSuitProduct()  {
    _productRepository.viewSuitProduct().
    then((data) {
      countSuitProduct= data;
      emit(GetSuitProduct(countSuitProduct));
      countSuitProduct= data;
    });
    return countSuitProduct;
  }
 List<ProductData> viewDressProduct()  {
    _productRepository.viewDressProduct().
    then((data) {
      countProduct= data;
      emit(GetDressProduct(countProduct));



    });
    return countProduct;
  }
 Future< List<ProductData>> viewUserProduct() async {
   await _productRepository.viewUserProduct().
    then((data) {
     countUserProduct= data;
      emit(GetUserProduct(countUserProduct));


    });
    return countUserProduct;
  }
  Future deleteItem(int index,String productId) async{
   await _productRepository.deleteItem(productId);
    countProduct.removeAt(index);
    emit(GetUserProduct(countProduct));

  }
  void deleteImage(List<String> imageUrl) {
    _productRepository.deleteImage(imageUrl);


  }
  changeItem(String item){
    var item2 = item;
    emit(GetChangeItem(item2));
  }
  changeIndex(int index){
    int newIndex = index;
    emit(GetChangeIndex(newIndex));
  }
  selectImage(int number) async {
    var pickImage =
    await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    switch (number) {
      case 1:
        _image1 = File(pickImage!.path);
   // imageList.add(_image1!);

        break;
      case 2:
        _image2 = File(pickImage!.path);
    //    imageList.add(_image2!);

        break;
      case 3:
        _image3 = File(pickImage!.path);
      //  imageList.add(_image3!);
        // setState(() {
        //   _image3 = File(pickImage!.path);
        //   //     image_list.add(_image3!);
        //   image_list[2] = _image3!;
        // });
    }
    emit(SelectImageState(_image1,_image2,_image3));
  }

}