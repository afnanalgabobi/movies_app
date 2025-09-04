import 'package:flutter/cupertino.dart';
import 'package:movies_app/model/movie_details_response/movie.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/love_or_rate_or_time_widget.dart';
import 'package:movies_app/ui/widgets/custom_app_bar.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

class MovieInfo extends StatelessWidget {
  MovieInfo({super.key, required this.movie});
  Movie movie;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
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
    ]);
  }
}
