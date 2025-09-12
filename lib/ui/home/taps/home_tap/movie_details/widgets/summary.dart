import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/model/movie_details_response/movie.dart';
class MovieSummary extends StatelessWidget {
  final MovieModel movie;
  const MovieSummary({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .03),
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
            (movie.descriptionFull != null &&
                    movie.descriptionFull!.trim().isNotEmpty)
                ? movie.descriptionFull!
                : (movie.descriptionIntro != null &&
                        movie.descriptionIntro!.trim().isNotEmpty)
                    ? movie.descriptionIntro!
                    : 'No summary available',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

