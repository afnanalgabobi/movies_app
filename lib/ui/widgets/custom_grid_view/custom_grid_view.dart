import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/custom_movies_container_item.dart';

import '../../../model/responsemovies/movie.dart';

class CustomGridView extends StatelessWidget {
  int crossAxisCount;
  double crossAxisSpacing;
  double mainAxisSpacing;
  int itemCount;
  double? childAspectRatio;
  List<Movie>? moviesList;

  CustomGridView(
      {super.key,
        required this.crossAxisCount,
        required this.crossAxisSpacing,
        required this.mainAxisSpacing,
        required this.itemCount,
        this.childAspectRatio,
    this.moviesList,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio?? 1/1,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return CustomMoviesContainerItem(
          movie: moviesList![index],
        );
      },
    );
  }
}
