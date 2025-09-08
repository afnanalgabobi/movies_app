part of 'reset_password_view_model.dart';

class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordLSuccess extends ResetPasswordState {
  String message;

  ResetPasswordLSuccess({required this.message});
}

final class ResetPasswordLError extends ResetPasswordState {
  String errorMessage;

  ResetPasswordLError({required this.errorMessage});
}
