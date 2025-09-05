import 'package:movies_app/model/responsemovies/movie.dart';

abstract class MovieStatues {}

class InitialMovieStatues extends MovieStatues {}

class LoadingMovieStatues extends MovieStatues {}

class ErrorMovieStatues extends MovieStatues {
  String? errorMassage;
  ErrorMovieStatues({required this.errorMassage});
}

class SuccessMovieStatues extends MovieStatues {
  List<Movie>? listmovies;
  SuccessMovieStatues({required this.listmovies});
}
