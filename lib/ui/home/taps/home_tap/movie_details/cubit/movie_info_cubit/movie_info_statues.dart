import 'package:movies_app/model/movie_details_response/movie.dart';

abstract class MovieInfoStatues {}

class InitialMovieInfoStatues extends MovieInfoStatues {}

class LoadingMovieInfoStatues extends MovieInfoStatues {}

class ErrorMovieInfoStatues extends MovieInfoStatues {
  String? errorMassage;
  ErrorMovieInfoStatues({required this.errorMassage});
}

class SuccessMovieinfoStatues extends MovieInfoStatues {
  Movie? movie;
  SuccessMovieinfoStatues({required this.movie});
}
