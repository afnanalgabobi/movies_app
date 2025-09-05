import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';
import '../../../../../../model/responsemovies/movie.dart';

class MovieSummary extends StatelessWidget {
  final Movie movie;
  const MovieSummary({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04, vertical: size.height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.summary,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Text(
            movie.descriptionFull ??  'There is no description',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
