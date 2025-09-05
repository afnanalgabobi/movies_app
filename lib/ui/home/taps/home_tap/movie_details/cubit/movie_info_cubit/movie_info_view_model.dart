import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'movie_info_statues.dart';

class MovieInfoViewModel extends Cubit<MovieInfoStatues> {
  MovieInfoViewModel() : super(InitialMovieInfoStatues());
  // hold data
  // handel Logic
  void getMoviesInfo({required int movieID}) async {
    try {
      emit(LoadingMovieInfoStatues());
      var response = await ApiManager.getMoviedetails(movieID: movieID);
      if (response!.status == 'error') {
        emit(ErrorMovieInfoStatues(errorMassage: response.statusMessage));
      } else {
        emit(SuccessMovieInfoStatues(movie: response.data!.movie));
      }
    } catch (e) {
      emit(ErrorMovieInfoStatues(errorMassage: e.toString()));
    }
  }
}
