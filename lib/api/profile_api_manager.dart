// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:movies_app/ui/home/taps/profile_tap/model/delete_profile_response.dart';
//
// import '../model/reset_password_response.dart';
// import '../ui/home/taps/profile_tap/model/profile_response.dart';
// import '../ui/home/taps/profile_tap/model/update_profile_request.dart';
// import 'api_constants.dart';
// import 'end_points.dart';
//
// class ProfileApiManager {
//   final String baseUrl = ApiConstants.baseAuthUrl;
//   static Uri profile_url =
//       Uri.https(ApiConstants.baseAuthUrl, EndPoints.profileEndPoint);
//
//   static Future<ProfileResponse> getProfileDetails(
//       {required String token}) async {
//     try {
//       var response = await http.get(
//         profile_url,
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );
//       var json = jsonDecode(response.body);
//       return ProfileResponse.fromJson(json);
//     } catch (e) {
//       throw Exception("Error in get Profile Details: $e");
//     }
//   }
//
//   static Future<ProfileResponse> updateProfile(
//       UpdateProfileRequest request, String token) async {
//     try {
//       print("Sending request to: $profile_url");
//       print("Body: ${jsonEncode(request.toJson())}");
//       var response = await http.patch(
//         profile_url,
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(request.toJson()),
//       );
//       var json = jsonDecode(response.body);
//       return ProfileResponse.fromJson(json);
//     } catch (e) {
//       throw Exception("Error in update Profile: $e");
//     }
//   }
//
//   static Future<DeleteProfileResponse> deleteProfile(String token) async {
//     try {
//       print("Sending request to: $profile_url");
//
//       var response = await http.delete(
//         profile_url,
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );
//
//       print("Status Code: ${response.statusCode}");
//       print("Response Body: ${response.body}");
//
//       var json = jsonDecode(response.body);
//
//       if (response.statusCode >= 200 && response.statusCode < 300) {
//         return DeleteProfileResponse.fromJson(json);
//       } else {
//         throw Exception(json["message"] ?? "Register failed");
//       }
//     } catch (e) {
//       throw Exception("Error in delete Profile: $e");
//     }
//   }
//
//   static Future<ResetPasswordResponse?> resetPasswordAuth(
//       String oldPassword, String newPassword, String token) async {
//     Uri url =
//         Uri.https(ApiConstants.baseAuthUrl, EndPoints.resetPasswordAuthApi);
//     var response = await http.patch(
//       url,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       },
//       body: jsonEncode({
//         "oldPassword": oldPassword,
//         "newPassword": newPassword,
//       }),
//     );
//     try {
//       var responseBody = response.body;
//       var json = jsonDecode(responseBody);
//       return ResetPasswordResponse.fromJson(json);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
