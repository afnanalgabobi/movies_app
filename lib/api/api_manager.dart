import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_constants.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:movies_app/model/responsemovies/responsemovies.dart';

class ApiManager {
  static Future<Responsemovies?> getMoviesList({String? category}) async {
    Uri url;
    if (category != null && category.isNotEmpty) {
      url = Uri.https(ApiConstants.baseUrl, EndPoints.moviesListendpoints,
          {"genre": category});
    } else {
      url = Uri.https(
        ApiConstants.baseUrl,
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
}
//https://yts.mx/api/v2/list_movies.json