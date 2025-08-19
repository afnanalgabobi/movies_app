import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStylesInter {
  static TextStyle regular20WhiteWithOpacity60 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.whiteColor.withAlpha(153),
  );
  static TextStyle regular20White = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.whiteColor,
  );
  static TextStyle regular20Black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.blackColor,
  );
  static TextStyle medium36White = GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle medium36Black = GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static TextStyle semibold20Black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
  static TextStyle semibold20White = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle semibold20Yellow = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.yellowColor,
  );
  static TextStyle bold20White = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle bold24White = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle bold24Black = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
  static TextStyle bold20Black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
  static TextStyle bold20Yellow = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.yellowColor,
  );
  static TextStyle bold20LightGray = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.lightGrayColor,
  );
}
