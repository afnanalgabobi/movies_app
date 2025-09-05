import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/model/movie_details_response/movie.dart';

class MovieSummary extends StatelessWidget {
  final Movie movie;

  const MovieSummary({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.summary,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Text(
            (movie.descriptionIntro != null &&
                    movie.descriptionIntro!.trim().isNotEmpty)
                ? movie.descriptionIntro!
                : (movie.descriptionFull != null &&
                        movie.descriptionFull!.trim().isNotEmpty)
                    ? movie.descriptionFull!
                    : 'No summary available',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

/*
(viewModel.movie?.descriptionFull.isNotEmpty == true)
                                ? viewModel.movie!.descriptionFull
                                : (viewModel.movie?.descriptionIntro.isNotEmpty == true
                                    ? viewModel.movie!.descriptionIntro
                                    : 'No Summary Available'),
 */
