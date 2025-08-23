import 'package:flutter/material.dart';
import 'package:movies_app/ui/update_profile/update_profile.dart';
import 'package:movies_app/utils/app_assets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = [
    Placeholder(),
    Placeholder(),
    Placeholder(),
    UpdateProfile(),
  ];

  var BottomNavigationBarItems = [
    AppAssets.homeTabUnselected,
    AppAssets.searchTabUnselected,
    AppAssets.browseTabUnselected,
    AppAssets.profileTabUnselected,
  ];
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Image.asset(BottomNavigationBarItems[0]),
          ),
          BottomNavigationBarItem(
            label: 'search',
            icon: Image.asset(BottomNavigationBarItems[1]),
          ),
          BottomNavigationBarItem(
            label: 'brows',
            icon: Image.asset(BottomNavigationBarItems[2]),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            icon: Image.asset(BottomNavigationBarItems[3]),
          ),
        ],
      ),
    );
  }
}
