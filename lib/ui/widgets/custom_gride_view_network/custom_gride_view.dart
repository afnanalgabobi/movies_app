import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/custom_movies_container_item.dart';
import 'package:movies_app/ui/widgets/custom_movies_container_item_network.dart';

import '../../../model/responsemovies/movie.dart';

class CustomGrideView_Network extends StatelessWidget {
  int crossAxisCount;
  double crossAxisSpacing;
  double mainAxisSpacing;
  List<Movie> moviesList;

  CustomGrideView_Network(
      {super.key,
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
        childAspectRatio: 3/4,

      ),
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        return CustomMoviesContainerItem_Network(
         movie: moviesList[index],
        );
      },
    );
  }
}
