part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}


class GetSuitProduct extends ProductState{
  List< ProductData> suitProductData;
  GetSuitProduct(this.suitProductData);




}
class GetDressProduct extends ProductState {
  List<ProductData> dressProductData;

  GetDressProduct(this.dressProductData);


}
class GetUserProduct extends ProductState{
  List< ProductData> userProduct;
  GetUserProduct(this.userProduct);







}