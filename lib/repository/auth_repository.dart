import 'package:dress_suit/web_services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  var signUp_userCredential;
  var signIn_userCredential;

  Future signUp(String email, String pass) async {
    signUp_userCredential = await _authService.signUp(email, pass);
    return signUp_userCredential;
  }

  Future signIn(String email, String pass) async {
    signIn_userCredential = await _authService.signIn(email, pass);
    return signIn_userCredential;
  }


  getCurrentUserId() {
    return _authService.getCurrentUserId();
  }

  void resetPassword(String email) {
    _authService.resetPassword(email);
  }
}
