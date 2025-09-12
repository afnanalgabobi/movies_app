import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/taps/browse_tap/browse_tap.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_index_cubit/category_index_cubit.dart';
import 'package:movies_app/ui/home/taps/home_tap/home_tap.dart';
import 'package:movies_app/ui/home/taps/profile_tap/profile_tap.dart';
import 'package:movies_app/ui/home/taps/search_tap/search_tap.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> taps = [
    HomeTap(),
    SearchTap(),
    BrowseTap(),
    ProfileTap(),
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: taps[selectedIndex],
      appBar: AppBar(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.02, vertical: size.height * 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), //
          child: NavigationBar(
            onDestinationSelected: onItemTapped,
            selectedIndex: selectedIndex,
            height: size.height * 0.05,
            destinations: [
              buildNavigationDestination(
                  unselectedImage: AppAssets.homeTabUnselected,
                  selectedImage: AppAssets.homeTabSelected,
                  unselectedImageColor: themeProvider.isDarkMode()
                      ? AppColors.whiteColor
                      : AppColors.grayColor),
              buildNavigationDestination(
                  unselectedImage: AppAssets.searchTabUnselected,
                  selectedImage: AppAssets.searchTabSelected,
                  unselectedImageColor: themeProvider.isDarkMode()
                      ? AppColors.whiteColor
                      : AppColors.grayColor),
              buildNavigationDestination(
                  unselectedImage: AppAssets.browseTabUnselected,
                  selectedImage: AppAssets.browseTabSelected,
                  unselectedImageColor: themeProvider.isDarkMode()
                      ? AppColors.whiteColor
                      : AppColors.grayColor),
              buildNavigationDestination(
                  unselectedImage: AppAssets.profileTabUnselected,
                  selectedImage: AppAssets.profileTabSelected,
                  unselectedImageColor: themeProvider.isDarkMode()
                      ? AppColors.whiteColor
                      : AppColors.grayColor)
            ],
            ),
          ),
        ),
      drawer: HomeDrawer(onDrawerItemClick: onDrawerItemClick,),
    );
  }

  buildNavigationDestination(
      {required String unselectedImage,
      required String selectedImage,
      required Color unselectedImageColor}) {
    return NavigationDestination(
        icon: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            unselectedImage,
            color: unselectedImageColor,
          ),
        ),
        label: '',
        selectedIcon: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(selectedImage)));
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      context.read<CategoryIndexCubit>().increaseIndex();
    });
  }

  void onDrawerItemClick(){
    Navigator.pop(context);
    setState(() {

    });

  }
}
