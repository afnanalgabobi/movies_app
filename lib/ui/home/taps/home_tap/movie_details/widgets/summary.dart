import 'package:flutter/cupertino.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/model/movie_details_response/movie.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

class MovieSummary extends StatelessWidget {
  final Movie movie;

  const MovieSummary({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: size.width * .02),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.summary,
            style: AppStylesRoboto.bold24White,
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Text(
            movie.descriptionFull ?? "",
            style: AppStylesRoboto.regular16White,
          ),
        ],
      ),
    );
  }
}
