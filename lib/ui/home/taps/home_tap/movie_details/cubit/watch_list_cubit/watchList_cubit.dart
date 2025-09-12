import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/model/movie_details_response/movie.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/watch_list_cubit/watchList_status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../model/responsemovies/movie.dart';

class WatchListCubit extends Cubit<WatchListStatus> {
  WatchListCubit() : super(InitialWatchListStatus());

  List<MovieModel> watchList = [];
  void getWatchList() async {
    try {
      emit(LoadingWatchListStatues());
      var response = await ApiManager.getFavouriteList();
      print(response);
      if (response!.status == 'error') {
        emit(ErrorWatchListStatues(errormessage: response.statusMessage));
      } else {
        // emit(SuccessWatchListStatues(watchList: response.data!.movies));
      }
    } catch (e) {
      emit(ErrorWatchListStatues(errormessage: e.toString()));
    }
  }

  void addMovieToWatchList(MovieModel movie) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (!watchList.any((m) => m.id == movie.id)) {
      watchList.add(movie);
      try {
        emit(LoadingWatchListStatues());
        var response = await ApiManager.addToFavouriteList(
            token: token, movieId: movie.id.toString());
        if (response!.status == 'error') {
          emit(ErrorWatchListStatues(errormessage: response.statusMessage));
        } else {
          emit(UpdatedWatchListStatus(
            watchList: List<MovieModel>.from(
              watchList,
            ),
          ));
        }
      } catch (e) {
        emit(ErrorWatchListStatues(errormessage: e.toString()));
      }
      // if (!watchList.any((m) => m.id == movie.id)) {
      //   watchList.add(movie);
      // }
      // emit(UpdatedWatchListStatus(watchList: List<MovieModel>.from(watchList,),));
    }
  }

  void removeFromWatchList(MovieModel movie) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (watchList.any((m) => m.id == movie.id)) {
      watchList.remove(movie);
      try {
        emit(LoadingWatchListStatues());
        var response = await ApiManager.removeMovieFromFavouriteList(
            token: token, movieId: movie.id.toString());
        if (response!.status == 'error') {
          emit(ErrorWatchListStatues(errormessage: response.statusMessage));
        } else {
          emit(UpdatedWatchListStatus(
            watchList: List<MovieModel>.from(
              watchList,
            ),
          ));
        }
      } catch (e) {
        emit(ErrorWatchListStatues(errormessage: e.toString()));
      }
    }
  }

}
