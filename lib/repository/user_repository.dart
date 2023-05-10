import 'package:dress_suit/web_services/user_service.dart';

import '../model/user_data.dart';

class UserRepository{
  final UsersService _usersService;

  UserRepository(this._usersService);

  UserData? userData;
  void saveUserData(String name, String phone, String adress) async {
    var email = _usersService.getCurrentUserEmail();

    UserData userData = UserData(name, email, adress, phone);

    _usersService.saveUserData(userData);
  }
  Future<UserData> viewUserData() async {

      var userData = await _usersService.viewUserData();

  return  UserData.fromMap(userData! );
}

  void updateUserData(String name, String email, String adress, String phone) {
    UserData userData = UserData(name, email, adress, phone);

    _usersService.updateUserData(userData.tomap());
  }
}