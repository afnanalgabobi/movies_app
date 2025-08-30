import 'package:movies_app/model/register_model/user_data.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class UpdateProfileLoadingState extends ProfileStates {}

class UpdateProfileSuccessState extends ProfileStates {
  final UserData user;
  final String successMessage;

  UpdateProfileSuccessState(this.user, this.successMessage);
}

class UpdateProfileErrorState extends ProfileStates {
  final String errorMessage;
  UpdateProfileErrorState(this.errorMessage);
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

class getProfileLoadingState extends ProfileStates {}

class getProfileSuccessState extends ProfileStates {
  final UserData data;

  getProfileSuccessState(this.data);
}

class getProfileErrorState extends ProfileStates {
  final String errorMessage;

  getProfileErrorState(this.errorMessage);
}

