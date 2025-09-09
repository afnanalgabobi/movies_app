import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_widget.dart';

import '../../../model/responsemovies/movie.dart';

class CustomGrideView extends StatelessWidget {
  int crossAxisCount;
  double crossAxisSpacing;
  double mainAxisSpacing;
  List<Movie> moviesList;

  CustomGrideView({
    super.key,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.moviesList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: 3 / 4,
      ),
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        return MovieWidget(movie: moviesList[index]);
      },
    );
  }
}
