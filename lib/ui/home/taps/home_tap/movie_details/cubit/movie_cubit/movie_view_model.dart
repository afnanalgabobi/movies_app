import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/movie_cubit/movie_statues.dart';

class MovieViewModel extends Cubit<MovieStatues> {
  MovieViewModel() : super(InitialMovieStatues());
  // hold data
  // handel Logic
  void getMoviesList() async {
    try {
      emit(LoadingMovieStatues());
      var response = await ApiManager.getMoviesList();
      if (response!.status == 'error') {
        emit(ErrorMovieStatues(errorMassage: response.statusMessage));
      } else {
        emit(SuccessMovieStatues(listmovies: response.data!.moviesList));
      }
    } catch (e) {
      emit(ErrorMovieStatues(errorMassage: e.toString()));
    }
  }
}
