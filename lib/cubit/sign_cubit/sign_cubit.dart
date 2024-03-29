import 'package:bloc/bloc.dart';
import 'package:dress_suit/web_services/auth_service.dart';


import '../../repository/auth_repository.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  final AuthService _authService;
  final AuthRepository _authRepository;
  SignCubit(this._authService,this._authRepository) : super(SignInitial());




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





  getCurrentUserId() {
    return _authRepository.getCurrentUserId();
  }

  void resetPassword(String email) {
    _authRepository.resetPassword(email);
  }
}
