import 'package:bloc/bloc.dart';
import 'package:dress_suit/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../connection/signUp.dart';
import '../../connection/user.dart';
import '../../model/user_data.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignInitial());
  SignFire _signFire=SignFire();
Repository repo=Repository();
  Users _users=Users();

  void signUp(String email,String pass)async{

   await repo.signUp(email,pass).then((value) => print('Success Register'));
   // emit(IsSignedUp());

  }
  void signIn(String email,String pass)async{
    //  emit(IsSignedUp());
    _signFire.signIn(email,pass).then((value) => print('Success Login'));


  }
void logOut(){
    _signFire.logOut();
 // FirebaseAuth.instance.signOut();
  //print('LogOut');

}
//  String getCurrentUser()  {
// return _signFire.getCurrentUser();
//
//
//   }
  void getEmail() {
    repo.getEmail().then((email) {
      emit(Loademail(email));
    });
 }
  Future viewUserData()async{
  return await  repo.viewUserData().then((data) => emit(getDataUser(data)));

  }
}
