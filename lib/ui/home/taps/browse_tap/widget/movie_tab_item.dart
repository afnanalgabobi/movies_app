import 'package:flutter/material.dart';
import '../../../../../utils/app_colors.dart';

class MovieTabItem extends StatelessWidget {
  bool isSelected;
  String movieName;
  Color? borderColor;
  Color selectedBgColor;
  TextStyle selectedTextStyle;
  TextStyle unSelectedTextStyle;

  MovieTabItem({super.key,
    required this.isSelected,
    required this.movieName,
    this.borderColor,
    required this.selectedBgColor,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      margin:EdgeInsets.symmetric(horizontal: width*0.01) ,
      padding: EdgeInsets.symmetric(horizontal: width*0.05,
          vertical: height*0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: borderColor ?? AppColors.yellowColor,
              width: 2
          ),
          color: isSelected? selectedBgColor : AppColors.transparentColor
      ),
      child: Text(movieName,
          style: isSelected? selectedTextStyle : unSelectedTextStyle),
    );
  }
}
