import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:movies_app/ui/home/taps/profile_tap/cubit/profile_states.dart';

import '../../../../../api/profile_api_manager.dart';
import '../model/delete_profile_response.dart';
import '../model/profile_model.dart';
import '../model/profile_response.dart';
import '../model/update_profile_request.dart';
import '../model/update_profile_response.dart';

class ProfileViewModel extends Cubit<ProfileStates> {
  ProfileViewModel() : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    try {
      final data = await ProfileApiManager.get(EndPoints.resetPasswordAuthApi);
      emit(ProfileSuccessState(ProfileResponse.fromJson(data) as ProfileModel));
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  Future<void> updateProfile(UpdateProfileRequest request) async {
    emit(UpdateProfileLoadingState());
    try {
      final data = await ProfileApiManager.patch(request.toJson());
      emit(UpdateProfileSuccessState(
          UpdateProfileResponse.fromJson(data) as String));
    } catch (e) {
      emit(UpdateProfileErrorState(e.toString()));
    }
  }

  Future<void> deleteProfile() async {
    emit(DeleteProfileLoadingState());
    try {
      final data = await ProfileApiManager.delete();
      emit(DeleteProfileSuccessState(
          DeleteProfileResponse.fromJson(data) as String));
    } catch (e) {
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
