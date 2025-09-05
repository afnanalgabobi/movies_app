import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/cast_item.dart';

import '../../../../../../model/movie_details_response/movie.dart';

class Cast extends StatelessWidget {
  Movie movie;

  Cast({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.cast,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: size.height * 0.003,
          ),
          ListView.separated(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  CastItem(castResponse: movie.cast![index]),
              separatorBuilder: (context, index) => SizedBox(
                    height: size.height * 0.008,
                  ),
              itemCount: 4),
        ],
      ),
    );
  }
}

//movie.cast!.toJson().length