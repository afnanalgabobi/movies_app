import '../../../../../model/register_model/user_data.dart';

class ProfileResponse {
  final String message;
  final UserData data;

  const ProfileResponse({
    required this.message,
    required this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      message: json['message'] as String,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data.toJson(),
      };
}
