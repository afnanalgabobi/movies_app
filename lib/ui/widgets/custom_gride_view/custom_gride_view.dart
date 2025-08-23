import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/custom_movies_container_item.dart';
import 'package:movies_app/utils/app_assets.dart';

class CustomGrideView extends StatelessWidget {
  int crossAxisCount;
  double crossAxisSpacing;
  double mainAxisSpacing;

  CustomGrideView(
      {super.key,
      required this.crossAxisCount,
      required this.crossAxisSpacing,
      required this.mainAxisSpacing});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomMoviesContainerItem(
          movieImagePath: AppAssets.containerImage,
          rateText: '7.7',
        );
      },
    );
  }
}
