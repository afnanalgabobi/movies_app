import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_constants.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:movies_app/model/LoginResponse.dart';
import 'package:movies_app/model/reset_password_response.dart';

import '../model/movie_details_response/movie_details_response.dart';
import '../model/register_model/register_request.dart';
import '../model/register_model/register_response.dart';
import '../model/responsemovies/responsemovies.dart';

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

  static Future<LoginResponse?> loginAuth(String email, String password) async {
    Uri url = Uri.https(ApiConstants.baseAuthUrl, EndPoints.loginAuthApi);
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);

      return LoginResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
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

  static Future<Responsemovies?> getMoviesList({String? category}) async {
    Uri url;
    if (category != null && category.isNotEmpty) {
      url = Uri.https(ApiConstants.baseMoviesUrl, EndPoints.moviesListEndPoints,
          {"genre": category});
    } else {
      url = Uri.https(
        ApiConstants.baseMoviesUrl,
        EndPoints.moviesListEndPoints,
      );
    }
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String responsebody = response.body;
        var json = jsonDecode(responsebody);
        return Responsemovies.fromJson(json);
      } else {
        print("Request failed with status: ${response.statusCode}");
        print("Response Body: ${response.body}");
        return null;
      }
    } catch (e) {
      print(" Exception in getMoviesList: $e");
      rethrow;
    }
  }

  static Future<MovieDetailsResponse?> getMoviedetails({int? movieID}) async {
    Uri url;
    // final url = Uri.parse(
    //     'https://yts.mx/api/v2/movie_details.json?movie_id=$movieId&with_images=true&with_cast=true');

    url = Uri.https(ApiConstants.baseMoviesUrl, EndPoints.moviesDetailsEndPoints,
        {
          "movie_id": movieID.toString(),
          "with_images": true.toString(),
          "with_cast" : true.toString()
        });

    print("Request URL: $url");

    try {
      var response = await http.get(url);
      print("Status Code: ${response.statusCode}");
      if (response.statusCode == 200) {
        String responsebody = response.body;

        var json = jsonDecode(responsebody);

        return MovieDetailsResponse.fromJson(json);
   } else {
        print("Request failed with status: ${response.statusCode}");
        print("Response Body: ${response.body}");
        return null;
      }
    } catch (e) {
      print(" Exception in getMoviesList: $e");
      rethrow;
    }
  }

  static Future<Responsemovies?> getSuggestedMoviesList(
      {String? movieId}) async {
    Uri url;
    if (movieId != null ) {
      url = Uri.https(ApiConstants.baseMoviesUrl, EndPoints.suggestedMoviesListEndPoints,
          {"movie_id": movieId});
    } else {
      url = Uri.https(
        ApiConstants.baseMoviesUrl,
        EndPoints.suggestedMoviesListEndPoints,
      );
    }
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String responseBody = response.body;
        var json = jsonDecode(responseBody);
        return Responsemovies.fromJson(json);
      } else {
        print("Request failed with status: ${response.statusCode}");
        print("Response Body: ${response.body}");
        return null;
      }
    } catch (e) {
      print(" Exception in getSuggestedMoviesList: $e");
      rethrow;
    }
  }

  static Future<MovieDetailsResponse?> getScreenshots({int? movieId}) async {
   print("movieId>> => ${movieId}");

   // final url = Uri.parse(
   //     'https://yts.mx/api/v2/movie_details.json?movie_id=$movieId&with_images=true&with_cast=true');
   Uri url = Uri.https(
       ApiConstants.baseMoviesUrl, EndPoints.moviesDetailsEndPoints,
       {
         "movie_id": movieId.toString(),
         "with_images": true.toString(),
         "with_cast": true.toString()
       });
    try{
      var response= await http.get(url);
      if(response.statusCode==200){
        var responseBody=response.body;
        var json= jsonDecode(responseBody);
        return MovieDetailsResponse.fromJson(json);
      }else{
        print("Request failed with status: ${response.statusCode}");
        print("Response Body: ${response.body}");
        return null;
      }
    }catch (e){
      print(" Exception in getMoviesList: $e");
      rethrow;
    }

  }
}
// static Future<Map<String, dynamic>> saveUser(String email, String password) async {
//   final token = "your_access_token_here";
//   Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.loginAuthApi);
//
//   final response = await http.get(
//     url,
//     headers: {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $token",
//     },
//   );
//   return jsonDecode(response.body);
// }
