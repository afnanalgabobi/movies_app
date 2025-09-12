import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../providers/app_Language_Provider.dart';
import '../../../providers/app_theme_provider.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  String selectedLanguage='';
  VoidCallback onDrawerItemClick;
  HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    selectedLanguage=languageProvider.appLanguage;
    return Drawer(
      backgroundColor: AppColors.blackColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: AppColors.yellowColor),
              child: Center(
                child: Text(AppLocalizations.of(context)!.movies_app,
                  style: AppStylesRoboto.bold24Black,),
              )
          ),
          InkWell(
            onTap: (){
              onDrawerItemClick();
            },
            child: ListTile(
              leading: Image.asset(AppAssets.homeIcon,color: AppColors.yellowColor,),
              title: Text(AppLocalizations.of(context)!.go_to_home,
                style: AppStylesRoboto.bold20White,),
            ),
          ),
          Divider(color: AppColors.whiteColor,
            indent: width*.07,
            endIndent: width*.07,),
          ListTile(
            leading: Image.asset(AppAssets.themeIcon,color: AppColors.yellowColor,),
            title: Text(AppLocalizations.of(context)!.theme,
              style: AppStylesRoboto.bold20White,),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.05),
            padding: EdgeInsets.symmetric(horizontal: width*0.03),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.yellowColor),
                borderRadius: BorderRadius.circular(16)
            ),
            child: DropdownButton<String>(
              value: themeProvider.isDarkMode()?AppLocalizations.of(context)!.dark:
              AppLocalizations.of(context)!.light,
              underline: SizedBox(),
              isExpanded: true,
              iconEnabledColor: AppColors.whiteColor,
              disabledHint: themeProvider.isDarkMode()?Text(AppLocalizations.of(context)!.dark,
                style: AppStylesRoboto.bold20White,):
              Text(AppLocalizations.of(context)!.light,
                style: AppStylesRoboto.bold20White,),
              dropdownColor: AppColors.blackColor,
              items: <String>[AppLocalizations.of(context)!.dark,
                AppLocalizations.of(context)!.light].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: AppStylesRoboto.bold20White),
                );
              }).toList(),
              onChanged: (value) {
                if(value==AppLocalizations.of(context)!.dark){
                  themeProvider.changeTheme(ThemeMode.dark);
                }else{
                  themeProvider.changeTheme(ThemeMode.light);
                }
              },
            ),
          ),
          SizedBox(height: height*.02,),
          Divider(color: AppColors.whiteColor,
            indent: width*.07,
            endIndent: width*.07,),
          ListTile(
            leading: Image.asset(AppAssets.languageIcon,color: AppColors.yellowColor,),
            title: Text(AppLocalizations.of(context)!.language,
              style: AppStylesRoboto.bold20White,),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.05),
            padding: EdgeInsets.symmetric(horizontal: width*0.03),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.yellowColor),
                borderRadius: BorderRadius.circular(16)
            ),
            child: DropdownButton<String>(
                value: selectedLanguage=='en'?AppLocalizations.of(context)!.english:
                AppLocalizations.of(context)!.arabic,
                disabledHint: selectedLanguage=='en'?Text(AppLocalizations.of(context)!.english,
                  style: AppStylesRoboto.bold20White,):
                Text(AppLocalizations.of(context)!.arabic,
                  style: AppStylesRoboto.bold20White,),
                underline: SizedBox(),
                dropdownColor: AppColors.blackColor,
                isExpanded: true,
                iconEnabledColor: AppColors.whiteColor,
                items: <String>[AppLocalizations.of(context)!.english,
                  AppLocalizations.of(context)!.arabic].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: AppStylesRoboto.bold20White,),
                  );
                }).toList(),
                onChanged: (value) {
                  if(value==AppLocalizations.of(context)!.english){
                    languageProvider.changeLanguage('en');
                  }else{
                    languageProvider.changeLanguage('ar');
                  }
                }
            ),
          )
        ],
      ),
    );
  }
}