import '../../../../../model/movie_details_response/movie.dart';
import '../../../../../model/responsemovies/movie.dart';

abstract class SearchTabStates {}

class SearchInitialState extends SearchTabStates {}

class SearchLoadingState extends SearchTabStates {}

class SearchSuccessState extends SearchTabStates {
  final List<Movie> movies;

  SearchSuccessState(this.movies);
}

class GetMoreMoviesLoadingState extends SearchTabStates {}

class SearchEmptyState extends SearchTabStates {}

class SearchErrorState extends SearchTabStates {
  final String message;

  SearchErrorState(this.message);
}
