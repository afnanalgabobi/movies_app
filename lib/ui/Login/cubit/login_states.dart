import 'package:movies_app/model/LoginResponse.dart';


class LoginState{}
class LoginLoadingState extends LoginState{}
class LoginInitialState extends LoginState{}
class LoginErrorState extends LoginState{
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}
class LoginSuccessState extends LoginState{
  LoginResponse response;
  LoginSuccessState({required this.response});
}