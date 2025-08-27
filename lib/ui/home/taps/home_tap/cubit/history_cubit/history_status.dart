import 'package:movies_app/model/responsemovies/movie.dart';

abstract class HistoryStatus {}

class InitialHistoryStatus extends HistoryStatus {}

class UpdatedHistoryStatus extends HistoryStatus {
  List<Movie> historymovie;
  UpdatedHistoryStatus({required this.historymovie});
}
