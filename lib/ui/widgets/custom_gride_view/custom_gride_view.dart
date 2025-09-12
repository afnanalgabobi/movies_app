import 'package:flutter/material.dart';
import '../../../model/movie_details_response/movie.dart';
import '../custom_movies_container_item.dart';

class CustomGrideView extends StatelessWidget {
  int crossAxisCount;
  double crossAxisSpacing;
  double mainAxisSpacing;
  List<MovieModel> moviesList;

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
          movie: moviesList[index],
        );
      },
    );
  }
}
