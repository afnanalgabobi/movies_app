import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/taps/profile_tap/cubit/profile_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../api/profile_api_manager.dart';
import '../model/update_profile_request.dart';

class ProfileViewModel extends Cubit<ProfileStates> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int? avaterId;

  var formKey = GlobalKey<FormState>();
  ProfileViewModel() : super(ProfileInitial());

  Future<void> getProfile() async {
    try {
      //todo: loading
      emit(getProfileLoadingState());
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        emit(getProfileErrorState('User not authenticated'));
        return;
      }
      var response = await ProfileApiManager.getProfileDetails(token: token);
      //todo: success
      emit(getProfileSuccessState(response.data));
    } catch (e) {
      //todo: error
      emit(getProfileErrorState(e.toString()));
    }
  }

  Future<void> updateProfile(UpdateProfileRequest request) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    try {
      //todo: loading
      emit(UpdateProfileLoadingState());
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        emit(UpdateProfileErrorState('User not authenticated'));
        return;
      }
      var response = await ProfileApiManager.updateProfile(request, token);
      //todo: success
      emit(UpdateProfileSuccessState(response.data, response.message));
    } catch (e) {
      //todo: error
      emit(UpdateProfileErrorState(e.toString()));
    }
  }

  Future<void> deleteProfile() async {
    try {
      //todo: loading
      emit(DeleteProfileLoadingState());
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        emit(DeleteProfileErrorState('User not authenticated'));
        return;
      }
      var response = await ProfileApiManager.deleteProfile(token);
      //todo: success
      emit(DeleteProfileSuccessState(response.message));
    } catch (e) {
      //todo: error
      emit(DeleteProfileErrorState(e.toString()));
    }
  }

// Future<void> resetPassword(ResetRequest request) async {
//   emit(ResetLoading());
//   try {
//     final data = await apiManager.patch(request.toJson());
//     emit(ResetSuccess(ResetResponse.fromJson(data)));
//   } catch (e) {
//     emit(ResetError(e.toString()));
//   }
// }
}

// class ProfileCubit extends Cubit<ProfileStates> {
//   ProfileCubit() : super(ProfileInitial());
//
//   final String baseUrl = ApiConstants.baseAuthUrl;
//   String? token;
//
//   /// Get profile
//   Future<void> getProfile() async {
//     emit(ProfileLoading());
//     try {
//       final response = await http.get(
//         Uri.parse("$baseUrl${ApiConstants.profileEndPoint}"),
//         headers: {"Authorization": "Bearer $token"},
//       );
//
//       final data = jsonDecode(response.body);
//
//       if (response.statusCode == 200) {
//         emit(ProfileSuccess(ProfileResponse.fromJson(data)));
//       } else {
//         emit(ProfileError(data["message"] ?? "Failed to load profile"));
//       }
//     } catch (e) {
//       emit(ProfileError(e.toString()));
//     }
//   }
//
//   /// Update profile
//   Future<void> updateProfile(UpdateProfileRequest request) async {
//     emit(UpdateProfileLoading());
//     try {
//       final response = await http.patch(
//         Uri.parse("$baseUrl${ApiConstants.profileEndPoint}"),
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token"
//         },
//         body: jsonEncode(request.toJson()),
//       );
//
//       final data = jsonDecode(response.body);
//
//       if (response.statusCode == 200) {
//         emit(UpdateProfileSuccess(UpdateProfileResponse.fromJson(data) as String));
//       } else {
//         emit(UpdateProfileError(data["message"] ?? "Failed to update profile"));
//       }
//     } catch (e) {
//       emit(UpdateProfileError(e.toString()));
//     }
//   }
//
//   /// Delete profile
//   Future<void> deleteProfile() async {
//     emit(DeleteProfileLoading());
//     try {
//       final response = await http.delete(
//         Uri.parse("$baseUrl${EndPoints.profileEndPoint}"),
//         headers: {"Authorization": "Bearer $token"},
//       );
//
//       final data = jsonDecode(response.body);
//
//       if (response.statusCode == 200) {
//         emit(DeleteProfileSuccess(DeleteProfileResponse.fromJson(data) as String));
//       } else {
//         emit(DeleteProfileError(data["message"] ?? "Failed to delete profile"));
//       }
//     } catch (e) {
//       emit(DeleteProfileError(e.toString()));
//     }
//   }
//
//   /// Reset password
//   Future<void> resetPassword(ResetRequest request) async {
//     emit(ResetLoading());
//     try {
//       final response = await http.patch(
//         Uri.parse("$baseUrl${EndPoints.resetPasswordAuthApi}"),
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token"
//         },
//         body: jsonEncode(request.toJson()),
//       );
//
//       final data = jsonDecode(response.body);
//
//       if (response.statusCode == 200) {
//         emit(ResetSuccess(ResetResponse.fromJson(data)));
//       } else {
//         emit(ResetError(data["message"] ?? "Failed to reset password"));
//       }
//     } catch (e) {
//       emit(ResetError(e.toString()));
//     }
//   }
// }
