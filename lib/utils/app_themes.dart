import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_styles_inter.dart';

import 'app_colors.dart';
import 'app_styles_roboto.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    canvasColor: AppColors.yellowColor,
    hoverColor: AppColors.transparentColor,
    focusColor: AppColors.redColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    tabBarTheme: TabBarThemeData(
      unselectedLabelStyle: AppStylesInter.bold20Yellow,
      //labelStyle: AppStylesInter.bold20Black,
      indicatorColor: AppColors.transparentColor,
      dividerColor: AppColors.transparentColor,
      labelColor: AppColors.yellowColor,
      unselectedLabelColor: AppColors.transparentColor,
      tabAlignment: TabAlignment.center,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparentColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.whiteColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparentColor,
      iconTheme: IconThemeData(color: AppColors.yellowColor),
      elevation: 0,
      titleTextStyle: AppStylesRoboto.regular16Yellow,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStylesInter.medium36White,
      labelSmall: AppStylesInter.semibold20Black,
      labelMedium: AppStylesInter.bold24White,
      headlineMedium: AppStylesInter.regular20White,
      headlineLarge: AppStylesRoboto.regular20Black,
      headlineSmall: AppStylesRoboto.regular14White,
      bodySmall: AppStylesRoboto.regular16Black,
      bodyMedium: AppStylesRoboto.regular20White,
      bodyLarge: AppStylesRoboto.bold24White,
      titleLarge: AppStylesInter.bold20Black,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    canvasColor: AppColors.yellowColor,
    hoverColor: AppColors.transparentColor,
    focusColor: AppColors.redColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    tabBarTheme: TabBarThemeData(
      unselectedLabelStyle: AppStylesInter.bold20Yellow,
      //labelStyle: AppStylesInter.bold20Black,
      indicatorColor: AppColors.transparentColor,
      dividerColor: AppColors.transparentColor,
      labelColor: AppColors.yellowColor,
      unselectedLabelColor: AppColors.transparentColor,
      tabAlignment: TabAlignment.center,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparentColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.whiteColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparentColor,
      iconTheme: IconThemeData(color: AppColors.yellowColor),
      elevation: 0,
      titleTextStyle: AppStylesRoboto.regular16Yellow,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStylesInter.medium36Black,
      labelSmall: AppStylesInter.semibold20White,
      labelMedium: AppStylesInter.bold24Black,
      headlineMedium: AppStylesInter.regular20Black,
      headlineLarge: AppStylesRoboto.regular20White,
      headlineSmall: AppStylesRoboto.regular14Black,
      bodySmall: AppStylesRoboto.regular16White,
      bodyMedium: AppStylesRoboto.regular20Black,
      bodyLarge: AppStylesRoboto.bold24Black,
      titleLarge: AppStylesInter.bold20White,
    ),
  );
}
