import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'reset_password_state.dart';

class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  ResetPasswordViewModel() : super(ResetPasswordInitial());

  Future<void> resetPassword() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    emit(ResetPasswordLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        emit(ResetPasswordLError(errorMessage: 'User not authenticated'));
        return;
      }

      var response = await ApiManager.resetPasswordAuth(
        oldPasswordController.text.trim(),
        newPasswordController.text.trim(),
        token,
      );

      if (response != null) {
        if (response.statusCode == 400 || response.error != null) {
          // In Error State
          String errorMessage = '';
          if (response.message is List) {
            errorMessage = (response.message as List).join('\n');
          } else if (response.message is String) {
            errorMessage = response.message;
          } else {
            errorMessage = response.error ?? 'Unknown error occurred';
          }
          emit(ResetPasswordLError(errorMessage: errorMessage));
        } else {
          // In Success State
          String successMessage = '';
          if (response.message is String) {
            successMessage = response.message;
          } else if (response.message is List) {
            successMessage = (response.message as List).join('\n');
          } else {
            successMessage = 'Password reset successfully';
          }
          emit(ResetPasswordLSuccess(message: successMessage));
        }
      }
    } catch (e) {
      emit(ResetPasswordLError(errorMessage: e.toString()));
    }
  }
}
