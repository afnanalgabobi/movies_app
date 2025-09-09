import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_details_response/cast_response.dart';
import 'package:movies_app/utils/app_colors.dart';

class CastItem extends StatelessWidget {
  CastResponse castResponse;

  CastItem({super.key, required this.castResponse});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      height: size.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.grayColor),
      child: Row(
        children: [
          SizedBox(
            height: size.height * 0.07,
            width: size.width * 0.16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageUrl: castResponse.urlSmallImage,
                height: size.height * 0.07,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.02),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${castResponse.name}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Character: ${castResponse.characterName}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
