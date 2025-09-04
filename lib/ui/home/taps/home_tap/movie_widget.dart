import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/responsemovies/movie.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/history_cubit/history_cubit.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

class MovieWidget extends StatefulWidget {
  MovieWidget({super.key, required this.movie});
  Movie movie;

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.read<HistoryCubit>().addMovie(widget.movie);
        Future.delayed(const Duration(microseconds: 500), () {
          return Navigator.pushNamed(
              context, AppRoutes.movieDetailsScreenRouteName,
              arguments: widget.movie.id);
        });

        //print(widget.movie.id);
        //print(context.read<HistoryCubit>().historyList);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: widget.movie.mediumCoverImage!,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
            //  Image.network(movie.mediumCoverImage!)
          ),
          Container(
              margin: EdgeInsets.only(
                  top: size.width * .02, left: size.width * .02),
              padding: EdgeInsets.only(
                left: size.width * .01,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.grayColor),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${widget.movie.rating}',
                    style: AppStylesRoboto.regular16White,
                  ),
                  const ImageIcon(
                    AssetImage(
                      AppAssets.starIcon,
                    ),
                    color: AppColors.yellowColor,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
