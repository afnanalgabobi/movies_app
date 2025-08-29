import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/reset_password_response.dart';
import 'api_constants.dart';
import 'end_points.dart';

class ProfileApiManager {
  final String baseUrl = ApiConstants.baseAuthUrl;
  static Uri profile_url =
      Uri.https(ApiConstants.baseAuthUrl, EndPoints.profileEndPoint);

  static String? token;

  /// Get request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(
      profile_url,
      headers: {"Authorization": "Bearer $token"},
    );
    return _handleResponse(response);
  }

  /// Post request
  static Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      profile_url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  /// Patch request
  static Future<Map<String, dynamic>> patch(Map<String, dynamic> body) async {
    final response = await http.patch(
      profile_url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  /// Delete request
  static Future<Map<String, dynamic>> delete() async {
    final response = await http.delete(
      profile_url,
      headers: {"Authorization": "Bearer $token"},
    );
    return _handleResponse(response);
  }

  static Future<ResetPasswordResponse?> resetPasswordAuth(
      String oldPassword, String newPassword, String token) async {
    Uri url =
        Uri.https(ApiConstants.baseAuthUrl, EndPoints.resetPasswordAuthApi);
    var response = await http.patch(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      }),
    );
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ResetPasswordResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  /// Handle API Response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    final data = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw Exception(data["message"] ?? "Something went wrong");
    }
  }
}
