import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

class LoveOrRateOrTimeWidget extends StatelessWidget {
  LoveOrRateOrTimeWidget({super.key, required this.image, required this.text});
  String image;
  String text;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .29,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.grayColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(
              image,
            ),
            color: AppColors.yellowColor,
          ),
          SizedBox(
            width: size.width * .05,
          ),
          Text(
            text,
            style: AppStylesRoboto.bold24White,
          )
        ],
      ),
    );
  }
}
