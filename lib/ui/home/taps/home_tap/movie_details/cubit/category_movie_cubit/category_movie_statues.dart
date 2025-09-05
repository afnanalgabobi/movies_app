import 'package:movies_app/model/responsemovies/movie.dart';

abstract class CategoryMovieStatues {}

class InitialCategoryMovieStatues extends CategoryMovieStatues {}

class LoadingCategoryMovieStatues extends CategoryMovieStatues {}

class ErorrCategoryMovieStatues extends CategoryMovieStatues {
  String? errormessage;
  ErorrCategoryMovieStatues({required this.errormessage});
}

class SuccessCategoryMovieStatues extends CategoryMovieStatues {
  List<Movie>? listmovies;
  SuccessCategoryMovieStatues({required this.listmovies});
}
