import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model/shared_preference.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.dark;

  AppThemeProvider() {
    loadTheme();
  }

  void changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) return;
    appTheme = newTheme;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'appTheme',
      appTheme == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  void setTheme(ThemeMode theme) {
    appTheme = theme;
    notifyListeners();
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('appTheme');

    if (savedTheme == 'dark') {
      appTheme = ThemeMode.dark;
    } else {
      appTheme = ThemeMode.light;
    }
    notifyListeners();
  }

  bool isDarkMode() => appTheme == ThemeMode.dark;
}
