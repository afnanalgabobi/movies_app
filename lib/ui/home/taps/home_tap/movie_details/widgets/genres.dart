import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

import '../../../../../../model/movie_details_response/movie.dart';

class Genres extends StatelessWidget {
  final MovieModel movie;

  const Genres({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final listGenres = movie.genres;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.genres,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: List.generate(
              listGenres!.length,
              (index) => Container(
                width: size.width * 0.24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.grayColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                child: Text(
                  listGenres[index],
                  style: AppStylesRoboto.regular16White,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .04,
          ),
        ],
      ),
    );
  }
}
