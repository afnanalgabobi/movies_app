import '../model/profile_model.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class UpdateProfileLoadingState extends ProfileStates {}

class UpdateProfileSuccessState extends ProfileStates {
  final String message;

  UpdateProfileSuccessState(this.message);
}

class UpdateProfileErrorState extends ProfileStates {
  final String errorMessage;

  UpdateProfileErrorState(this.errorMessage);
}

class DeleteProfileLoadingState extends ProfileStates {}

class DeleteProfileSuccessState extends ProfileStates {
  final String message;

  DeleteProfileSuccessState(this.message);
}

class DeleteProfileErrorState extends ProfileStates {
  final String errorMessage;

  DeleteProfileErrorState(this.errorMessage);
}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final ProfileModel data;

  ProfileSuccessState(this.data);
}

class ProfileErrorState extends ProfileStates {
  final String errorMessage;

  ProfileErrorState(this.errorMessage);
}

// class ResetLoading extends ProfileStates {}
//
// class ResetSuccess extends ProfileStates {
//   final ResetResponse resetResponse;
//   ResetSuccess(this.resetResponse);
// }
//
// class ResetError extends ProfileStates {
//   final String errorMessage;
//   ResetError(this.errorMessage);
// }
