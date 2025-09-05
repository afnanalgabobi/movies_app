import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/api_manager.dart';
import '../../../../model/user_model/shared_preference.dart';
import 'login_states.dart';

class LoginViewModel extends Cubit<LoginState> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginViewModel() : super(LoginInitialState());

  static LoginViewModel get(context) => BlocProvider.of(context);

  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      try {
        final response = await ApiManager.loginAuth(
            emailController.text, passwordController.text);

        if (response != null && response.message == "Success Login") {
          final token = response.data ?? "";
          await AppPreferences.saveUserToken(token);
          print('Response message => ${response.message}');
          print('Response token => ${response.data}');
          emit(LoginSuccessState(response: response));
          var mytoken = await AppPreferences.getUserToken();
          print('My token => ${mytoken}');
        } else {
          emit(LoginErrorState(
              errorMessage: response?.message ?? "Login failed"));
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/api/api_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'login_states.dart';
//
// class LoginViewModel extends Cubit<LoginState> {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//   LoginViewModel() : super(LoginInitialState());
//
//   Future<void> login() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (formKey.currentState?.validate() == true) {
//       emit(LoginLoadingState());
//       try {
//         var response = await ApiManager.loginAuth(
//             emailController.text, passwordController.text);
//         if (response != null) {
//           //Password does not match
//           //Success Login
//           if (response.message == "Success Login") {
//             await prefs.setString('token', response.data ?? "");
//             print("Response message => ${response.message}");
//             print("Response token => ${response.data}");
//             emit(LoginSuccessState(response: response));
//           } else if (response.message == "Password does not match") {
//             emit(LoginErrorState(errorMessage: "Password does not match"));
//           }
//         } else {
//           emit(LoginErrorState(errorMessage: response!.message!));
//         }
//       } catch (e) {
//         emit(LoginErrorState(errorMessage: e.toString()));
//       }
//     }
//   }
// }
