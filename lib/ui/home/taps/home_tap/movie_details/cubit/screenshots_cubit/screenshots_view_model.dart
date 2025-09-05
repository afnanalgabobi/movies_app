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
    var response = await ApiManager.getScreenshots(movieId: movieId, withImages: true);
    if(response == null || response.status == 'error'){
      emit(ErrorScreenshotsStates(errorMassage: response?.statusMessage?? "Failed to load screenshots"));
    }else{
      print(response.data!.movie);
      print("response.mediumScreenshotImage1 => ${response.data!.movie!.mediumScreenshotImage1}");
      var movie = response.data!.movie;
      screenshots.add(movie!.mediumScreenshotImage1!.toString());
      screenshots.add(movie.mediumScreenshotImage2!.toString());
      screenshots.add(movie.mediumScreenshotImage3!.toString());
      print("screenshots.length => ${screenshots.length}");
      emit(SuccessScreenshotsStates(screenshotsList: screenshots));
    }
  }catch(e){
    emit(ErrorScreenshotsStates(errorMassage:e.toString()));
  }



}

}