import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_routes.dart';

import '../../model/movie_details_response/movie.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles_roboto.dart';

class CustomMoviesContainerItem extends StatelessWidget {
  final String? movieId;
  final String imagePath;
  final double? rating;
  Movie movie;

  CustomMoviesContainerItem(
      {super.key,
      required this.imagePath,
      this.rating,
      required this.movieId,
      required this.movie});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () async {
        Navigator.of(context).pushNamed(AppRoutes.movieDetailsScreenRouteName,
            arguments: [movie, movie.id]);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: AppColors.blackColorWithObacity,
                blurRadius: 6,
                offset: Offset(0, 4))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error,
                  size: 25,
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.yellowColor,
                    ),
                  );
                },
              ),
              rating == null || rating == 0
                  ? const SizedBox.shrink()
                  : Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                            color: AppColors.blackColorWithObacity,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              (rating ?? 0).toStringAsFixed(1),
                              style: AppStylesRoboto.regular16White,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Image.asset(AppAssets.starIcon)
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
