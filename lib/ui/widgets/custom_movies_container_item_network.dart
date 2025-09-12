import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../model/movie_details_response/movie.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles_roboto.dart';

class CustomMoviesContainerItem_Network extends StatelessWidget {
  MovieModel movie;

  CustomMoviesContainerItem_Network({super.key, required this.movie});

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
          image: CachedNetworkImageProvider(movie.backgroundImage.toString()),
          fit: BoxFit.cover,
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
                  movie.rating.toString(),
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
