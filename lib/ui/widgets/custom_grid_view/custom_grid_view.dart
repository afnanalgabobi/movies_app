import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/custom_movies_container_item.dart';
import 'package:movies_app/utils/app_assets.dart';

class CustomGridView extends StatelessWidget {
  int crossAxisCount;
  double crossAxisSpacing;
  double mainAxisSpacing;
  int itemCount;
  double? childAspectRatio;

  CustomGridView(
      {super.key,
      required this.crossAxisCount,
      required this.crossAxisSpacing,
      required this.mainAxisSpacing,
      required this.itemCount,
      this.childAspectRatio});

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
          movieImagePath: AppAssets.containerImage,
          rateText: '7.7',
        );
      },
    );
  }
}
