import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/model/responsemovies/movie.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/screenshots_cubit/screenshots_states.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/screenshots_cubit/screenshots_view_model.dart';
import 'package:movies_app/utils/app_colors.dart';

class ScreenShots extends StatefulWidget {
  late int? movieId;

  ScreenShots({super.key, required this.movieId});

  @override
  State<ScreenShots> createState() => _ScreenShotsState();
}

class _ScreenShotsState extends State<ScreenShots> {
  ScreenshotViewModel viewModel=ScreenshotViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getScreenshots(movieId: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return BlocProvider<ScreenshotViewModel>(
      create: (context) => viewModel,
      child: BlocBuilder<ScreenshotViewModel,ScreenshotsStates>(builder: (context, state) {
        if(state is SuccessScreenshotsStates){
          return SizedBox(
            height: height*0.62,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.screen_shots,
                  style: Theme.of(context).textTheme.bodyLarge,),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(state.screenshotsList![index],
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height*0.02,);
                      },
                      itemCount: state.screenshotsList!.length),
                ),

              ],
            ),
          );
        }else if(state is ErrorScreenshotsStates){
          return Center(child: Text('No Screenshots Found'));
        }else{
          return CircularProgressIndicator(
            color: AppColors.grayColor,
          );
        }
      },),
    );



  }
}
