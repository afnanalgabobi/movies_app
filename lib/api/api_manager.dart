import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_constants.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:movies_app/model/LoginResponse.dart';
import 'package:movies_app/model/responsemovies/responsemovies.dart';
class ApiManager {
  static Future<LoginResponse?> loginAuth(String email,
      String password) async {
    Uri url = Uri.https(ApiConstants.baseAuthUrl, EndPoints.loginAuthApi);


    var response = await http.post(url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    try{
      var responseBody = response.body;
      var json=jsonDecode(responseBody);
      return LoginResponse.fromJson(json);
    }catch(e){
      throw e;

    }
  }

  static Future<Responsemovies?> getMoviesList({String? category}) async {
    Uri url;
    if (category != null && category.isNotEmpty) {
      url = Uri.https(ApiConstants.baseMoviesUrl, EndPoints.moviesListendpoints,
          {"genre": category});
    } else {
      url = Uri.https(
        ApiConstants.baseMoviesUrl,
        EndPoints.moviesListendpoints,
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
}