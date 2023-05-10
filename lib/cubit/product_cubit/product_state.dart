part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}


class GetSuitProduct extends ProductState{
 final List< ProductData> suitProductData;
  GetSuitProduct(this.suitProductData);




}
class GetDressProduct extends ProductState {
 final List<ProductData> dressProductData;

  GetDressProduct(this.dressProductData);


}
class GetChangeItem extends ProductState {
 final String text;

  GetChangeItem(this.text);


}
class GetChangeIndex extends ProductState {
 final int index;

 GetChangeIndex(this.index);


}
  class GetUserProduct extends ProductState{
 final List< ProductData> userProduct;
  GetUserProduct(this.userProduct);


}
class SaveProductState extends ProductState{

 SaveProductState();


}
class SelectImageState extends ProductState{
 File? image1;
 File? image2;
 File? image3;

 SelectImageState(this.image1, this.image2, this.image3);
}