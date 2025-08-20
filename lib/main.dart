import 'package:flutter/material.dart';
import 'package:movies_app/feature/auth/forget_password.dart';
import 'package:movies_app/feature/auth/login_screen.dart';
import 'package:movies_app/feature/auth/register_screen.dart';
import 'package:movies_app/providers/app_Language_Provider.dart';
import 'package:movies_app/providers/app_theme_provider.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedLang = prefs.getString('language') ?? 'en';
  final savedTheme =
      prefs.getString('theme') == 'dark' ? ThemeMode.dark : ThemeMode.light;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => AppLanguageProvider()..setLanguage(savedLang),
    ),
    ChangeNotifierProvider(
      create: (_) => AppThemeProvider()..setTheme(savedTheme),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreenRouteName,
      routes: {
        AppRoutes.loginScreenRouteName: (context) => LoginScreen(),
        AppRoutes.registerScreenRouteName: (context) => RegisterScreen(),
        AppRoutes.forgetPasswordScreenRouteName: (context) => ForgetPassword()
      },
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      themeMode: ThemeMode.dark,
    );
  }
}
