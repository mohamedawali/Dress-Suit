part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class GetDataUser extends UserState {
  UserData? userData;

  GetDataUser(this.userData);


}
class GetUserProduct extends UserState{
  List< ProductData> userProduct;
  GetUserProduct(this.userProduct);
  






}
