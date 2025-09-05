import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/love_or_rate_or_time_widget.dart';
import 'package:movies_app/ui/widgets/custom_app_bar.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

import '../../../../../../model/movie_details_response/movie.dart';
import '../cubit/movie_info_cubit/movie_info_statues.dart';
import '../cubit/movie_info_cubit/movie_info_view_model.dart';

class MovieInfo extends StatefulWidget {
  MovieInfo({super.key, required this.viewModel, required this.movieId});
var viewModel;
var movieId;
  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

      return BlocBuilder<MovieInfoViewModel, MovieInfoStatues>(
        bloc: widget.viewModel,
        builder: (context, state) {
          if (state is LoadingMovieInfoStatues) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.yellowColor,
              ),
            );
          } else if (state is ErrorMovieInfoStatues) {
            return Column(
              children: [
                Text(state.errorMassage!),
                ElevatedButton(
                    onPressed: () {
                      widget.viewModel.getMoviesInfo(movieID: widget.movieId!);
                    },
                    child: const Text('try again')),
              ],
            );
          } else if (state is SuccessMovieInfoStatues) {
            Movie movie = state.movie!;

            return  Stack(children: [
              Opacity(
                opacity: .4,
                child: Image.network(
                  movie.mediumCoverImage ?? '',
                  width: double.infinity,
                  height: size.height * .6,
                  // height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomAppBar(
                    title: '',
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const ImageIcon(
                        AssetImage(
                          AppAssets.arrowBackIcon,
                        ),
                        color: AppColors.whiteColor,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: size.width * .02),
                        child: const ImageIcon(
                          AssetImage(
                            AppAssets.markIcon,
                          ),
                          color: AppColors.whiteColor,
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    AppAssets.playIcon,
                    height: size.height * .3,
                  ),
                  Text(
                    movie.title ?? '',
                    style: AppStylesRoboto.bold24White,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Text(
                    movie.year.toString(),
                    style: AppStylesRoboto.bold20LightGray,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
                    child: CustomElevatedButton(
                      onPressed: () {},
                      text: 'Watch',
                      borderColor: AppColors.redColor,
                      textStyle: AppStylesRoboto.bold20White,
                      backgroundColor: AppColors.redColor,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
                    child: SizedBox(
                      height: size.height * .05,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          LoveOrRateOrTimeWidget(
                              image: AppAssets.favoriteIcon,
                              text: movie.likeCount.toString()),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          LoveOrRateOrTimeWidget(
                              image: AppAssets.durationIcon,
                              text: movie.runtime.toString()),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          LoveOrRateOrTimeWidget(
                              image: AppAssets.starIcon, text: movie.rating.toString()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]);}
          return SizedBox();}

    );
  }
}
