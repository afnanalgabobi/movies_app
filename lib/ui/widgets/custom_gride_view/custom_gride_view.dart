import 'package:flutter/material.dart';

import '../../../model/movie_details_response/movie.dart';
import '../custom_movies_container_item.dart';

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
        return CustomMoviesContainerItem(
          imagePath: moviesList[index].backgroundImage ?? '',
          movieId: moviesList[index].imdbCode,
          rating: moviesList[index].rating,
          movie: moviesList[index],
        );
      },
    );
  }
}
