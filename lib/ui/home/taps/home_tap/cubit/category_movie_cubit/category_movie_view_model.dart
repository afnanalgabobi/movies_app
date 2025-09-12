import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_movie_cubit/category_movie_statues.dart';

class CategoryMovieViewModel extends Cubit<CategoryMovieStatues> {
  CategoryMovieViewModel() : super(InitialCategoryMovieStatues());
  // hold data
  // handel Logic
  void getCategorytMoviesList({required String category}) async {
    try {
      emit(LoadingCategoryMovieStatues());
      var response = await ApiManager.getMoviesList(category: category);
      if (response!.status == 'error') {
        emit(ErorrCategoryMovieStatues(errormessage: response.statusMessage));
      } else {
        emit(
            SuccessCategoryMovieStatues(listmovies: response.data!.moviesList));
      }
    } catch (e) {
      emit(ErorrCategoryMovieStatues(errormessage: e.toString()));
    }
  }
}
