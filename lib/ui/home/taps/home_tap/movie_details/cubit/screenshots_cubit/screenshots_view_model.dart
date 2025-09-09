import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/screenshots_cubit/screenshots_states.dart';

class ScreenshotViewModel extends Cubit<ScreenshotsStates>{
  List<String> screenshots = [];
  int? movieId;
  ScreenshotViewModel():super(InitialScreenshotsStates());

void getScreenshots({required int? movieId}) async {
  try{
    emit(LoadingScreenshotsStates());
      var response = await ApiManager.getScreenshots(movieId: movieId);
      if(response == null || response.status == 'error'){
      emit(ErrorScreenshotsStates(errorMassage: response?.statusMessage?? "Failed to load screenshots"));
    }else{
      print(response.data!.movie);
      print("response.mediumScreenshotImage1 => ${response.data!.movie!.mediumScreenshotImage1}");
      var movie = response.data!.movie;
        if (movie?.mediumScreenshotImage1 != null)
          screenshots.add(movie!.mediumScreenshotImage1!);
        if (movie?.mediumScreenshotImage2 != null)
          screenshots.add(movie!.mediumScreenshotImage2!);
        if (movie?.mediumScreenshotImage3 != null)
          screenshots.add(movie!.mediumScreenshotImage3!);

        if (screenshots.isEmpty) {
          emit(ErrorScreenshotsStates(
              errorMassage: "No screenshots found for this movie"));
        } else {
          emit(SuccessScreenshotsStates(screenshotsList: screenshots));
        }
      }
  }catch(e){
    emit(ErrorScreenshotsStates(errorMassage:e.toString()));
  }
}

}

/*var movie = response.data!.movie;
      screenshots.add(movie!.mediumScreenshotImage1!.toString());
      screenshots.add(movie.mediumScreenshotImage2!.toString());
      screenshots.add(movie.mediumScreenshotImage3!.toString());
      print("screenshots.length => ${screenshots.length}");
      emit(SuccessScreenshotsStates(screenshotsList: screenshots));*/