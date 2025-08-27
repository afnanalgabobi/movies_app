import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/responsemovies/movie.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/history_cubit/history_status.dart';

class HistoryCubit extends Cubit<HistoryStatus> {
  HistoryCubit() : super(InitialHistoryStatus());

  List<Movie> historyList = [];

  void addMovie(Movie movie) {
    if (!historyList.any((m) => m.id == movie.id)) {
      historyList.add(movie);
      emit(UpdatedHistoryStatus(historymovie: List<Movie>.from(historyList)));
    }
  }
}

/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/responsemovies/movie.dart';

class HistoryCubit extends Cubit<List<Movie>> {
  HistoryCubit() : super([]);

  void addMovie(Movie movie) {
    final updated = List<Movie>.from(state)..add(movie);
    emit(updated);
  }

  void clearHistory() {
    emit([]);
  }
}

 */
