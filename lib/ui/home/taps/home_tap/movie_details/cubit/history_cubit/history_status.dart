import '../../../../../../../model/movie_details_response/movie.dart';

abstract class HistoryStatus {}

class InitialHistoryStatus extends HistoryStatus {}

class UpdatedHistoryStatus extends HistoryStatus {
  List<MovieModel> historymovie;
  MovieModel backgroundmovie;
  UpdatedHistoryStatus(
      {required this.historymovie, required this.backgroundmovie});
}
