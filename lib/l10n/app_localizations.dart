import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @goto_home.
  ///
  /// In en, this message translates to:
  /// **'Go To Home'**
  String get goto_home;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get something_went_wrong;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @waiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting ...'**
  String get waiting;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading ...'**
  String get loading;

  /// No description provided for @register_succefully.
  ///
  /// In en, this message translates to:
  /// **'Register Succefully'**
  String get register_succefully;

  /// No description provided for @please_enter_email.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Email'**
  String get please_enter_email;

  /// No description provided for @please_enter_pass.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Password'**
  String get please_enter_pass;

  /// No description provided for @please_enter_repass.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Re-Password'**
  String get please_enter_repass;

  /// No description provided for @please_enter_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Email'**
  String get please_enter_valid_email;

  /// No description provided for @pass_length_error.
  ///
  /// In en, this message translates to:
  /// **'Password Must Be At Least 6 Character'**
  String get pass_length_error;

  /// No description provided for @please_enter_name.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Name'**
  String get please_enter_name;

  /// No description provided for @do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Re-Password doesn’t Match Password.'**
  String get do_not_match;

  /// No description provided for @onboarding_title_screen1.
  ///
  /// In en, this message translates to:
  /// **'Find Your Next Favorite Movie Here'**
  String get onboarding_title_screen1;

  /// No description provided for @onboarding_subtitle_screen1.
  ///
  /// In en, this message translates to:
  /// **'Get access to a huge library of movies to suit all tastes. You will surely like it.'**
  String get onboarding_subtitle_screen1;

  /// No description provided for @explore_now.
  ///
  /// In en, this message translates to:
  /// **'Explore Now'**
  String get explore_now;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @onboarding_title_screen2.
  ///
  /// In en, this message translates to:
  /// **'Discover Movies'**
  String get onboarding_title_screen2;

  /// No description provided for @onboarding_subtitle_screen2.
  ///
  /// In en, this message translates to:
  /// **'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.'**
  String get onboarding_subtitle_screen2;

  /// No description provided for @onboarding_title_screen3.
  ///
  /// In en, this message translates to:
  /// **'Explore All Genres'**
  String get onboarding_title_screen3;

  /// No description provided for @onboarding_subtitle_screen3.
  ///
  /// In en, this message translates to:
  /// **'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.'**
  String get onboarding_subtitle_screen3;

  /// No description provided for @onboarding_title_screen4.
  ///
  /// In en, this message translates to:
  /// **'Create Watch lists'**
  String get onboarding_title_screen4;

  /// No description provided for @onboarding_subtitle_screen4.
  ///
  /// In en, this message translates to:
  /// **'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.'**
  String get onboarding_subtitle_screen4;

  /// No description provided for @onboarding_title_screen5.
  ///
  /// In en, this message translates to:
  /// **'Rate, Review, and Learn'**
  String get onboarding_title_screen5;

  /// No description provided for @onboarding_subtitle_screen5.
  ///
  /// In en, this message translates to:
  /// **'Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews.'**
  String get onboarding_subtitle_screen5;

  /// No description provided for @onboarding_title_screen6.
  ///
  /// In en, this message translates to:
  /// **'Start Watching Now'**
  String get onboarding_title_screen6;

  /// No description provided for @avatar.
  ///
  /// In en, this message translates to:
  /// **'Avatar'**
  String get avatar;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'ForgetPassword?'**
  String get forget_password;

  /// No description provided for @do_not_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don’t Have Account ?'**
  String get do_not_have_account;

  /// No description provided for @create_one.
  ///
  /// In en, this message translates to:
  /// **'Create One'**
  String get create_one;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @login_with_google.
  ///
  /// In en, this message translates to:
  /// **'Login With Google'**
  String get login_with_google;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account ?'**
  String get already_have_account;

  /// No description provided for @forget_password2.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forget_password2;

  /// No description provided for @verify_email.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get verify_email;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get seeMore;

  /// No description provided for @watch.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get watch;

  /// No description provided for @screen_shots.
  ///
  /// In en, this message translates to:
  /// **'Screen Shots'**
  String get screen_shots;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @wish_list.
  ///
  /// In en, this message translates to:
  /// **'Wish List'**
  String get wish_list;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @watch_list.
  ///
  /// In en, this message translates to:
  /// **'Watch List'**
  String get watch_list;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @update_data.
  ///
  /// In en, this message translates to:
  /// **'Update Data'**
  String get update_data;

  /// No description provided for @pick_avatar.
  ///
  /// In en, this message translates to:
  /// **'Pick Avatar'**
  String get pick_avatar;

  /// No description provided for @similar.
  ///
  /// In en, this message translates to:
  /// **'Similar'**
  String get similar;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @cast.
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get cast;

  /// No description provided for @genres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genres;

  /// No description provided for @enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Name'**
  String get enter_your_name;

  /// No description provided for @name_must_be_more_than_2_character.
  ///
  /// In en, this message translates to:
  /// **'Name Must Be More Than 2 Character'**
  String get name_must_be_more_than_2_character;

  /// No description provided for @enter_your_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter your Email'**
  String get enter_your_email;

  /// No description provided for @valid_email.
  ///
  /// In en, this message translates to:
  /// **'Please Enter A Valid Email'**
  String get valid_email;

  /// No description provided for @enter_your_pass.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get enter_your_pass;

  /// No description provided for @enter_your_old_pass.
  ///
  /// In en, this message translates to:
  /// **'Please enter your old password'**
  String get enter_your_old_pass;

  /// No description provided for @enter_your_new_pass.
  ///
  /// In en, this message translates to:
  /// **'Please enter your new password'**
  String get enter_your_new_pass;

  /// No description provided for @enter_your_confirm_new_pass.
  ///
  /// In en, this message translates to:
  /// **'Please enter your confirm new password'**
  String get enter_your_confirm_new_pass;

  /// No description provided for @pass_more_than_8.
  ///
  /// In en, this message translates to:
  /// **'Password Should Be More Than 8 Characters'**
  String get pass_more_than_8;

  /// No description provided for @pass_reg_ex.
  ///
  /// In en, this message translates to:
  /// **'Password must contain an uppercase letter, a number, and a special character'**
  String get pass_reg_ex;

  /// No description provided for @enter_re_pass.
  ///
  /// In en, this message translates to:
  /// **'Please Re-Enter Your Password'**
  String get enter_re_pass;

  /// No description provided for @pass_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Password & ConfirmPassword Don’t Match'**
  String get pass_do_not_match;

  /// No description provided for @enter_your_phone.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Phone'**
  String get enter_your_phone;

  /// No description provided for @phone_length.
  ///
  /// In en, this message translates to:
  /// **'Phone Number Must be More Than 10 digit (e.g. 01123456789)'**
  String get phone_length;

  /// No description provided for @phone_number_must_start_with.
  ///
  /// In en, this message translates to:
  /// **'Phone number must start with +20'**
  String get phone_number_must_start_with;

  /// No description provided for @egyptian_mobile_number_example.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Egyptian mobile number (e.g. +201012345678)'**
  String get egyptian_mobile_number_example;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @old_password.
  ///
  /// In en, this message translates to:
  /// **'Old password'**
  String get old_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @confirm_new_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirm_new_password;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @summery.
  ///
  /// In en, this message translates to:
  /// **'Summery'**
  String get summery;

  /// No description provided for @geners.
  ///
  /// In en, this message translates to:
  /// **'Geners'**
  String get geners;

  /// No description provided for @movie.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get movie;

  /// No description provided for @movies_app.
  ///
  /// In en, this message translates to:
  /// **'Movies App'**
  String get movies_app;

  /// No description provided for @go_to_home.
  ///
  /// In en, this message translates to:
  /// **'Go To Home'**
  String get go_to_home;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
