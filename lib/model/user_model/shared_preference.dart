import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String _keyToken = "TOKEN";
  static const String _keyIsLoggedIn = "IS_LOGGED_IN";

  static Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
    await prefs.setBool(_keyIsLoggedIn, true);
  }

  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
