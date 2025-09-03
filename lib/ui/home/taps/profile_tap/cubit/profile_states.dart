import 'package:movies_app/model/register_model/user_data.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class ProfileLoading extends ProfileStates {}

class ProfileLoaded extends ProfileStates {
  final UserData user;
  ProfileLoaded(this.user);
}

class ProfileError extends ProfileStates {
  final String message;
  ProfileError(this.message);
}

class DeleteProfileLoadingState extends ProfileStates {}

class DeleteProfileSuccessState extends ProfileStates {
  final String successMessage;

  DeleteProfileSuccessState(this.successMessage);
}

class DeleteProfileErrorState extends ProfileStates {
  final String errorMessage;
  DeleteProfileErrorState(this.errorMessage);
}
