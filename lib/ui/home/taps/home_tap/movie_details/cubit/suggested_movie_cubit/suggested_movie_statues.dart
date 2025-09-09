import '../../../../../../../model/movie_details_response/movie.dart';

abstract class SuggestedMovieStatues {}

class InitialSuggestedMovieStatues extends SuggestedMovieStatues {}

class LoadingSuggestedMovieStatues extends SuggestedMovieStatues {}

class ErrorSuggestedMovieStatues extends SuggestedMovieStatues {
  String? errorMassage;
  ErrorSuggestedMovieStatues({required this.errorMassage});
}

class SuccessSuggestedMovieStatues extends SuggestedMovieStatues {
  List<Movie>? suggestedMovieList;
  SuccessSuggestedMovieStatues({required this.suggestedMovieList});
}
