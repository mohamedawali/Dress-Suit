part of 'sign_cubit.dart';

@immutable
abstract class SignState {}

class SignInitial extends SignState {

}
class IsSignedUp extends SignState{
User? user;


}
class Loademail extends SignState{
  var email;

  Loademail(this.email);




}

class getDataUser extends SignState{
  UserData? userData;
  getDataUser(this.userData);




}