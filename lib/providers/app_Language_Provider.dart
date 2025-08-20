import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';

  AppLanguageProvider() {
    loadLanguage();
  }

  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) return;
    appLanguage = newLanguage;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', appLanguage);
  }

  void setLanguage(String lang) {
    appLanguage = lang;
    notifyListeners();
  }

  void loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedLang = prefs.getString('appLanguage');
    if (savedLang != null) {
      appLanguage = savedLang;
      notifyListeners();
    }
  }
}
