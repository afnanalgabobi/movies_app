import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

import '../../../utils/app_colors.dart';
import '../../model/responsemovies/movie.dart';

class CustomMoviesContainerItem extends StatelessWidget {
  Movie? movie;
  bool isMovie;
  CustomMoviesContainerItem({super.key, this.movie, this.isMovie = true});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width * 0.4,
      height: height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: isMovie
              ? AssetImage(movie!.backgroundImage.toString())
              : AssetImage(AppAssets.containerImage),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.whiteColor,
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.01, vertical: height * 0.004),
            decoration: BoxDecoration(
                color: AppColors.blackColorWithObacity,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isMovie ? movie!.rating.toString() : '7.7',
                  style: AppStylesRoboto.regular16White,
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Image.asset(AppAssets.starIcon)
              ],
            ),
          )
        ],
      ),
    );
  }
}
