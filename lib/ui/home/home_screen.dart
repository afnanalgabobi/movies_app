import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/taps/browse_tap/browse_tap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_index_cubit/category_index_cubit.dart';
import 'package:movies_app/ui/home/taps/home_tap/home_tap.dart';
import 'package:movies_app/ui/home/taps/search_tap/search_tap.dart';
import 'package:movies_app/ui/update_profile/update_profile.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> taps = [
    HomeTap(),
    const SearchTap(),
     BrowseTap(),
    UpdateProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16), //
          child: BottomNavigationBar(
            onTap: onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.grayColor,
            items: [
              buildbottomnavigationbaritem(
                  label: 'home',
                  unselectedimage: AppAssets.homeTabUnselected,
                  selectedimage: AppAssets.homeTabSelected,
                  index: 0),
              buildbottomnavigationbaritem(
                  label: 'search',
                  unselectedimage: AppAssets.searchTabUnselected,
                  selectedimage: AppAssets.searchTabSelected,
                  index: 1),
              buildbottomnavigationbaritem(
                  label: 'brows',
                  unselectedimage: AppAssets.browseTabUnselected,
                  selectedimage: AppAssets.browseTabSelected,
                  index: 2),
              buildbottomnavigationbaritem(
                  label: 'profile',
                  unselectedimage: AppAssets.profileTabUnselected,
                  selectedimage: AppAssets.profileTabSelected,
                  index: 3),
            ],
          ),
        ),
      ),
    );
  }

  buildbottomnavigationbaritem(
      {required String label,
        required String unselectedimage,
        required int index,
        required String selectedimage}) {
    return BottomNavigationBarItem(
      label: label,
      icon: Image.asset(
        index == selectedIndex ? selectedimage : unselectedimage,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      context.read<CategoryIndexCubit>().increaseIndex();
    });
  }
}
