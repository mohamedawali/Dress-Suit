
import 'package:bloc/bloc.dart';


import 'package:dress_suit/repository/user_repository.dart';

import 'package:meta/meta.dart';

import '../../model/user_data.dart';
import '../../model/user_product.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository ;
  UserCubit(this._userRepository) : super(UserInitial());


  List<ProductData>count_product = [];
  List<ProductData>count_SuitProduct = [];
  List<ProductData>count_userProduct = [];

  List<UserData>x = [];
  var emails;
  var url;

  void saveUserData(String name, String phone, String adress) {
    _userRepository.saveUserData(name, phone, adress);
  }

  Future viewUserData() async {
    await _userRepository.viewUserData().then((data) {

      emit(GetDataUser(data));
    });
  }

  void updateUserData(String name, String email, String adress, String phone) {
    _userRepository.updateUserData(name, email, adress, phone);
  }

}
