import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/suggested_movie_cubit/suggested_movie_statues.dart';

class SuggestedMovieViewModel extends Cubit<SuggestedMovieStatues> {
  SuggestedMovieViewModel() : super(InitialSuggestedMovieStatues());
  // hold data

  // handel Logic
 void getSuggestedMoviesList( {required String? movieId}) async {
    if(movieId !=null)
    {
      try {
      emit(LoadingSuggestedMovieStatues());
      var response = await ApiManager.getSuggestedMoviesList(movieId: movieId);
      if (response!.status == 'error') {
        emit(ErrorSuggestedMovieStatues(errorMassage: response.statusMessage));
      } else {
        emit(SuccessSuggestedMovieStatues(suggestedMovieList: response.data!.movies));
      }
    } catch (e) {
      emit(ErrorSuggestedMovieStatues(errorMassage: e.toString()));
    }}
    else   emit(ErrorSuggestedMovieStatues(errorMassage: 'error'));

 }
}
