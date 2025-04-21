class CommonState {}

class CommonSuccessState extends CommonState {
  int value;
  CommonSuccessState({required this.value});
}

class CommonLoadingState extends CommonState {}
