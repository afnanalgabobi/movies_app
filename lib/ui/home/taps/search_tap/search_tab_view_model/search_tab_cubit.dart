import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/ui/home/taps/search_tap/search_tab_view_model/search_tab_states.dart';
import '../../../../../model/movie_details_response/movie.dart';

class SearchTabCubit extends Cubit<SearchTabStates> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  int page = 1;
  List<Movie> movies = [];

  SearchTabCubit() : super(SearchInitialState()) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool atTop = scrollController.position.pixels == 0;
        if (!atTop && state is! GetMoreMoviesLoadingState) {
          page++;
          emit(GetMoreMoviesLoadingState());
          searchMovies();
        }
      }
    });
  }

  Future<void> searchMovies() async {
    if (searchController.text.trim().isEmpty) return;
    if (movies.isEmpty) {
      emit(SearchLoadingState());
    }
    try {
      final result =
          await ApiManager.getMoviesByQuery(searchController.text, page) ?? [];

      movies.addAll(result);
      if (movies.isEmpty) {
        emit(SearchEmptyState());
        return;
      }

      emit(SearchSuccessState(result));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}
