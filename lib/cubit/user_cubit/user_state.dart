part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
// class Loademail extends UserState{
//   var email;
//
//   Loademail(this.email);
//
//
//
//
// }
class getImageUrl extends UserState{
  var url;

  getImageUrl(this.url);




}