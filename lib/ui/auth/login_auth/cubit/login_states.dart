


class LoginState{}
class LoginLoadingState extends LoginState{}
class LoginInitialState extends LoginState{}
class LoginErrorState extends LoginState{
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}
class LoginSuccessState extends LoginState{
  final String token;

  LoginSuccessState({required this.token});
}