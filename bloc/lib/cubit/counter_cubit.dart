import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/common_state.dart';

class CounterCubit extends Cubit<CommonState> {
  CounterCubit() : super(CommonSuccessState(value: 0));
  int count = 0;

  void increment() async {
    emit(CommonLoadingState());
    await Future.delayed(Duration(seconds: 2));
    count++;
    emit(CommonSuccessState(value: count));
  }

  void decrement() async {
    emit(CommonLoadingState());
    await Future.delayed(Duration(seconds: 2));
    count--;
    emit(CommonSuccessState(value: count));
  }
}
