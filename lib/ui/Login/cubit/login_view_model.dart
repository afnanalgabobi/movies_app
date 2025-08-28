import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/ui/Login/cubit/login_states.dart';

class LoginViewModel extends Cubit<LoginState> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginViewModel():super(LoginInitialState());

  Future<void> login()async{
    if(formKey.currentState?.validate()==true){
      emit(LoginLoadingState());
      try{
        var response= await ApiManager.loginAuth(emailController.text, passwordController.text);
        if(response != null){
          emit(LoginSuccessState(response: response));
        }
       else{
          emit(LoginErrorState(errorMessage: response!.message!));
          return;
        }
      }catch(e){
        emit(LoginErrorState(errorMessage: e.toString()));

      }
    }

  }

}