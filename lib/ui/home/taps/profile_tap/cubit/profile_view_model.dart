import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/register_model/user_data.dart';
import 'package:movies_app/ui/home/taps/profile_tap/cubit/profile_states.dart';
import '../../../../../api/api_constants.dart';
import '../../../../../api/end_points.dart';
import '../../../../../model/user_model/shared_preference.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  int selectedAvatar = 2;
  int selectedTab = 0;

  void changeAvatar(int newAvatar) {
    selectedAvatar = newAvatar;
  }

  void changeTab(int newTab) {
    selectedTab = newTab;
  }

  UserData? currentProfile;

  ProfileCubit() : super(ProfileInitial());
  void getUserByToken() async {
    var token = await AppPreferences.getUserToken();
    print('My token => ${token}');
    if (token == null) {
      throw Exception("No token found, user not logged in");
    }
    Uri url = Uri.https(ApiConstants.baseAuthUrl, EndPoints.profileEndPoint);
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      currentProfile = UserData.fromJson(data['data']);
    } else {
      throw Exception("Failed to fetch user: ${response.body}");
    }
  }

  // loadProfile
  Future<void> loadProfile() async {
    // print('loadProfile');
    getUserByToken();
    emit(ProfileLoading());
    try {
      // print('ProfileLoading');
      await Future.delayed(const Duration(milliseconds: 1500));
//       currentProfile = getUserByToken(token: myToken);
      emit(ProfileLoaded(currentProfile!));
      // print(currentProfile!.email);
    } catch (e) {
      emit(ProfileError("field to load profile"));
    }
  }

  Future<void> updateProfile(String name, int avatar, String phone) async {
    if (currentProfile == null) {
      print('user not found');
      return;
    }

    try {
      var token = await AppPreferences.getUserToken();
      print('on update : My token => ${token}');
      print(currentProfile!.avaterId);
      Uri url = Uri.https(ApiConstants.baseAuthUrl, EndPoints.profileEndPoint);

      var response = await http.patch(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({"name": name, "phone": phone, "avaterId": avatar}));
      if (response.statusCode == 200) {
        final updatedProfile =
            currentProfile!.copyWith(name: name, avatar: avatar, phone: phone);
        currentProfile = updatedProfile;
        print(currentProfile!.name);
        print(currentProfile!.phone);
        print(currentProfile!.avaterId.toString());
        final json = jsonDecode(response.body);
        print("✅ Profile updated: ${json['data']}");
      } else {
        print("❌ Failed: ${response.body}");
      }
    } catch (e) {
      emit(ProfileError("Failed $e"));
    }
  }

//
// updateProfile
// Future<void> updateProfile(String name,int avatar, String phone) async {
//   if (currentProfile == null) {
//     print('not found');
//     return;
//   }
//   emit(ProfileLoading());
//   try {
//     await Future.delayed(const Duration(seconds: 1));
//     final updated = currentProfile!.copyWith(name: name,avatar: avatar, phone: phone);
//     currentProfile = updated;
//     print(currentProfile!.phone);
//     print('user is updatedddddddddd');
//     emit(ProfileLoaded(updated));
//   } catch (e) {
//     emit(ProfileError("field to update profile"));
//   }
//   }
}
