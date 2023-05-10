part of 'main_home_cubit.dart';

@immutable
abstract class MainHomeState {}

class MainHomeInitial extends MainHomeState {}
class ChangePageState extends MainHomeState {
  final int index;

  ChangePageState(this.index);
}
