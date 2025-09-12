import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/model/register_model/user_data.dart';
import 'package:movies_app/ui/home/taps/profile_tap/cubit/profile_states.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4YjJhMGNiOWY2ODhhYmMzZmMyYTdmOCIsImVtYWlsIjoiYWZuYW5hbGdhYmdvYmlAZ21haWwuY29tIiwiaWF0IjoxNzU3NTkyODQxfQ.jyr23Vim9cD4mt-WlVj7CEJpHurXbnhBbIOki-5U3HA

  UserData? currentProfile;

  ProfileCubit() : super(ProfileInitial());
  void getUserByToken() async {
    var token = await AppPreferences.getUserToken();
    print('My user token => ${token}');
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
          body: jsonEncode({
            "name": name,
            "phone": phone,
            "avaterId": avatar}));

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

  Future<void> deleteProfile() async {
    if (currentProfile == null) {
      emit(DeleteProfileErrorState("Failed delete user"));
      return;
    }
    try {
      var token = await AppPreferences.getUserToken();
      print('on delete : My token => ${token}');
      ApiManager.deleteUser(token);
      emit(DeleteProfileSuccessState("user deleted Successfully"));
    } catch (e) {
      emit(DeleteProfileErrorState("Failed $e"));
    }
  }
  Future<void> exit() async {
    if (currentProfile == null) {
      emit(DeleteProfileErrorState("Failed exit"));
      return;
    }
    try {
      await AppPreferences.logout();
    } catch (e) {
      emit(DeleteProfileErrorState("Failed exit"));
    }
  }
}