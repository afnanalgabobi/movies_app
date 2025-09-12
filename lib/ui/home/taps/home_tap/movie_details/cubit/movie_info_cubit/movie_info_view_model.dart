import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        emit(SuccessMovieInfoStatues(movie: response.data!.movie,isFavorite: false));
        print(
            "description_intro => ${response.data?.movie?.descriptionIntro}");
        print("description_full  => ${response.data?.movie?.descriptionFull}");
      }
    } catch (e) {
      emit(ErrorMovieInfoStatues(errorMassage: e.toString()));
    }
  }
  Future<void> checkIfMovieIsFav(String movieId) async {
    emit(LoadingMovieInfoStatues());
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await ApiManager.movieIsFavorite(
        token: token,
        movieId: movieId,
      );

      final bool isFav = response?.data == true;

      // لو عندك أفلام حالياً في الستيت، خذها، وإلا خليه فاضي
      final movies = state is SuccessMovieInfoStatues
          ? (state as SuccessMovieInfoStatues).movie
          : null;

      emit(SuccessMovieInfoStatues(movie: movies, isFavorite: isFav));
    } catch (e) {
      emit(ErrorMovieInfoStatues(errorMassage: e.toString()));
    }
  }
}
