import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/apis/api_constants.dart';
import 'package:movies_app/apis/end_points.dart';
import 'package:movies_app/model/register_request.dart';

import '../model/register_response.dart';

class ApiManager {
  static Future<RegisterResponse> registerAuth(RegisterRequest request) async {
    Uri url = Uri.https(
      ApiConstants.baseAuthUrl,
      EndPoints.registerAuthApi,
    );

    try {
      print("Sending request to: $url");
      print("Body: ${jsonEncode(request.toJson())}");

      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      var json = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return RegisterResponse.fromJson(json);
      } else {
        throw Exception(json["message"] ?? "Register failed");
      }
    } catch (e) {
      throw Exception("Error in register: $e");
    }
  }
}
