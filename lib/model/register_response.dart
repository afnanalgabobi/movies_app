import 'package:movies_app/model/user_data.dart';

class RegisterResponse {
  final String? message;
  final UserData? user;
  final String statusCode;

  const RegisterResponse({
    required this.message,
    required this.user, required this.statusCode});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String,
      user: json['data'] != null ? UserData.fromJson(json['data']) : null,
        statusCode: json['statusCode'] as String);
  }
}

// class UserData {
//   final String email;
//   final String password;
//   final String name;
//   final String phone;
//   final int avaterId;
//   final String id;
//   final String createdAt;
//   final String updatedAt;
//   final int v;
//
//   UserData({
//     required this.email,
//     required this.password,
//     required this.name,
//     required this.phone,
//     required this.avaterId,
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });
//
//   factory UserData.fromJson(Map<String, dynamic> json) {
//     return UserData(
//       email: json["email"],
//       password: json["password"],
//       name: json["name"],
//       phone: json["phone"],
//       avaterId: json["avaterId"],
//       id: json["_id"],
//       createdAt: json["createdAt"],
//       updatedAt: json["updatedAt"],
//       v: json["__v"],
//     );
//   }
// }
