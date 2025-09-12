import '../../../../../../../model/movie_details_response/movie.dart';

abstract class WatchListStatus {}

class InitialWatchListStatus extends WatchListStatus {}

class LoadingWatchListStatues extends WatchListStatus {}

class ErrorWatchListStatues extends WatchListStatus {
  String? errormessage;
  ErrorWatchListStatues({required this.errormessage});
}

class SuccessWatchListStatues extends WatchListStatus {

  List<MovieModel> watchList;

  SuccessWatchListStatues({required this.watchList});
}

class UpdatedWatchListStatus extends WatchListStatus {
  List<MovieModel> watchList;
  UpdatedWatchListStatus(
      {required this.watchList});
}

