import '../../../../../../../model/movie_details_response/movie.dart';

abstract class CategoryMovieStatues {}

class InitialCategoryMovieStatues extends CategoryMovieStatues {}

class LoadingCategoryMovieStatues extends CategoryMovieStatues {}

class ErorrCategoryMovieStatues extends CategoryMovieStatues {
  String? errormessage;
  ErorrCategoryMovieStatues({required this.errormessage});
}

class SuccessCategoryMovieStatues extends CategoryMovieStatues {
  List<MovieModel>? listmovies;
  SuccessCategoryMovieStatues({required this.listmovies});
}
