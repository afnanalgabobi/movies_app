import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final String name;
  final String email;
  final int avatar;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.phone,
  });

  User copyWith({String? name, int? avatar, String? phone}) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email,
      avatar: avatar ?? this.avatar,
      phone: phone ?? this.phone,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"].toString(),
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      avatar: json["avatarIndex"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "avatar": avatar,
    };
  }
}

// ===== States =====
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;
  ProfileLoaded(this.user);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

// ===== Cubit (ViewModel) =====
class ProfileCubit extends Cubit<ProfileState> {
  int selectedAvatar = 0;
  int selectedTab = 0;

  void changeAvatar(int newAvatar) {
    selectedAvatar = newAvatar;
  }

  void changeTab(int newTab) {
    selectedTab = newTab;
  }

  User? currentProfile;
  final profile = User(
      id: '1',
      name: "Afnan",
      email: "afnan@email.com",
      avatar: 2,
      phone: '777777777');
  ProfileCubit() : super(ProfileInitial());

  // loadProfile
  Future<void> loadProfile(String userId) async {
    print('loadProfile');
    emit(ProfileLoading());
    try {
      print('ProfileLoading');
      await Future.delayed(const Duration(seconds: 1));

      currentProfile = profile;

      emit(ProfileLoaded(profile));
      print(currentProfile!.email);
    } catch (e) {
      emit(ProfileError("field to load profile"));
    }
  }

  Future<void> updateProfile(String name, int avatar, String phone) async {
    if (currentProfile == null) {
print('user not found');
      return;
    }
    emit(ProfileLoading());

    try {
      final updatedProfile =
          currentProfile!.copyWith(name: name, avatar: avatar, phone: phone);
      print('user updated');

      final response = await http.put(
        Uri.parse("https://example.com/api/users/${currentProfile!.id}"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(updatedProfile.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        currentProfile = User.fromJson(data);
        print('profile updated');
        emit(ProfileLoaded(currentProfile!));
      } else {
        emit(ProfileError("فشل تحديث البروفايل (كود: ${response.statusCode})"));
      }
    } catch (e) {
      emit(ProfileError("خطأ في الاتصال: $e"));
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
