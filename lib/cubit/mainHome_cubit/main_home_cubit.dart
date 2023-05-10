import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_home_state.dart';

class MainHomeCubit extends Cubit<MainHomeState> {

  MainHomeCubit() : super(MainHomeInitial());

  changePage(int index){
int newIndex=index;
emit(ChangePageState(newIndex));
  }
}
