import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/providers/app_Language_Provider.dart';
import 'package:movies_app/providers/app_theme_provider.dart';
import 'package:movies_app/providers/onBoarding_Provider.dart';
import 'package:movies_app/ui/OnBoarding/onBoarding_screen.dart';
import 'package:movies_app/ui/auth/forget_password_screen.dart';
import 'package:movies_app/ui/auth/login_auth/login_screen.dart';
import 'package:movies_app/ui/auth/register_auth/register_screen.dart';
import 'package:movies_app/ui/home/home_screen.dart';
import 'package:movies_app/ui/home/taps/browse_tap/browse_tap.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_index_cubit/category_index_cubit.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/history_cubit/history_cubit.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/movie_details.dart';
import 'package:movies_app/ui/home/taps/profile_tap/cubit/profile_view_model.dart';
import 'package:movies_app/ui/home/taps/profile_tap/profile_tap.dart';
import 'package:movies_app/ui/home/taps/profile_tap/reset_passworf/views/reset_password_view.dart';
import 'package:movies_app/ui/home/taps/profile_tap/update_profile/update_profile.dart';
import 'package:movies_app/ui/home/taps/search_tap/search_tab_view_model/search_tab_cubit.dart';
import 'package:movies_app/ui/home/taps/search_tap/search_tap.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_themes.dart';
import 'package:movies_app/utils/my_bloc_observer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  final prefs = await SharedPreferences.getInstance();
  final savedLang = prefs.getString('language') ?? 'en';
  final savedTheme =
      prefs.getString('theme') == 'dark' ? ThemeMode.dark : ThemeMode.light;
  Bloc.observer = MyBlocObserver();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppLanguageProvider()..setLanguage(savedLang),
        ),
        ChangeNotifierProvider(
          create: (_) => AppThemeProvider()..setTheme(savedTheme),
        ),
        ChangeNotifierProvider(create: (context) => OnBoardingProvider()),
        //   ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          //  BlocProvider.value(
          //   value: historyCubit, // reuse same instance everywhere
          // ),
          // BlocProvider.value(
          //   value: profileCubit, // reuse same instance everywhere
          // ),
          BlocProvider(create: (context) => CategoryIndexCubit()),
          BlocProvider(create: (context) => HistoryCubit()),
          BlocProvider(create: (context) => ProfileCubit()),
          BlocProvider(
            create: (context) => SearchTabCubit(),
          )
          //    BlocProvider(create: (context) => MovieViewModel()),
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenRouteName,
      routes: {
        AppRoutes.onboardingScreenRouteName: (context) => OnBoardingScreen(),
        AppRoutes.loginScreenRouteName: (context) => LoginScreen(),
        AppRoutes.registerScreenRouteName: (context) => RegisterScreen(),
        AppRoutes.forgetPasswordScreenRouteName: (context) =>
            ForgetPasswordScreen(),
         AppRoutes.updateProfileScreenRouteName: (context) => UpdateProfile(),
        AppRoutes.homeScreenRouteName: (context) => HomeScreen(),
        AppRoutes.SearchTabRouteName: (context) => SearchTap(),
        AppRoutes.BrowseTabRouteName: (context) => BrowseTap(),
        AppRoutes.movieDetailsScreenRouteName: (context) => MovieDetails(),
          AppRoutes.resetPasswordScreenRouteName: (context) =>
              ResetPasswordScreen(),
         AppRoutes.profileTabRouteName: (context) => ProfileTap()
      },
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
