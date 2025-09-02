import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_styles_inter.dart';

import 'app_colors.dart';
import 'app_styles_roboto.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    canvasColor: AppColors.whiteColor,
    hoverColor: AppColors.transparentColor,
    focusColor: AppColors.redColor,
    dividerColor: AppColors.grayColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    cardColor: AppColors.grayColor,
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: AppStylesInter.bold20Yellow,
      //labelStyle: AppStylesInter.bold20Black,
      indicatorColor: AppColors.transparentColor,
      dividerColor: AppColors.transparentColor,
      labelColor: AppColors.yellowColor,
      unselectedLabelColor: AppColors.transparentColor,
      tabAlignment: TabAlignment.center,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparentColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.whiteColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      iconTheme: const IconThemeData(color: AppColors.yellowColor),
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
        titleMedium: AppStylesRoboto.regular16White,
        titleSmall: AppStylesRoboto.regular14White,
        displayLarge: AppStylesRoboto.bold20White,
        displayMedium: AppStylesRoboto.bold36White),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    canvasColor: AppColors.blackColor,
    hoverColor: AppColors.lightGrayColor,
    focusColor: AppColors.redColor,
    dividerColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.whiteColor,
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: AppStylesInter.bold20Yellow,
      //labelStyle: AppStylesInter.bold20Black,
      indicatorColor: AppColors.transparentColor,
      dividerColor: AppColors.transparentColor,
      labelColor: AppColors.yellowColor,
      unselectedLabelColor: AppColors.transparentColor,
      tabAlignment: TabAlignment.center,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparentColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.whiteColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: const IconThemeData(color: AppColors.yellowColor),
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
        titleMedium: AppStylesRoboto.regular16Black,
        titleSmall: AppStylesRoboto.regular14Black,
        displayLarge: AppStylesRoboto.bold20Black,
        displayMedium: AppStylesRoboto.bold36Black),
  );
}
