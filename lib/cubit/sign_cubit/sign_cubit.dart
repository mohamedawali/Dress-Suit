import 'package:bloc/bloc.dart';
import 'package:dress_suit/web_services/auth_service.dart';


import '../../repository/auth_repository.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignInitial());

  AuthRepository _authRepository = AuthRepository();
  AuthService _authService=AuthService();

  var signIn_result, signUp_result;

  signUp(String email, String pass) async {
   await  _authRepository.signUp(email, pass)

     .then((value) {
      signUp_result = value;
    });
    return signUp_result;
  }

  signIn(String email, String pass)  async{
  await   _authRepository.signIn(email, pass).then((value) {

      signIn_result = value;
         });
    return signIn_result;


  }
  void logOut() {
   _authService .logOut();
  }



  // void getCurrentEmail() {
  //   repo.getCurrentEmail().then((email) => emit(getCurrentemail(email)));
  // }


  getCurrentUserId() {
    return _authRepository.getCurrentUserId();
  }

  void resetPassword(String email) {
    _authRepository.resetPassword(email);
  }
}
