import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_Language_Provider.dart';

class CustomLanguageToggleSwitch extends StatefulWidget {
  const CustomLanguageToggleSwitch({super.key});

  @override
  State<CustomLanguageToggleSwitch> createState() =>
      _CustomLanguageToggleSwitchState();
}

class _CustomLanguageToggleSwitchState
    extends State<CustomLanguageToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    double toggleHeight = size.height * 0.05;
    double indicatorSize = toggleHeight * 0.9;
    double spacing = size.width * 0.05;
    double borderRadius = toggleHeight / 2;

    var languageProvider = Provider.of<AppLanguageProvider>(context);
    int currentIndex = languageProvider.appLanguage == 'en' ? 0 : 1;
    // 0 = English, 1 = Arabic
    return Center(
      child: AnimatedToggleSwitch<int>.rolling(
        current: currentIndex,
        borderWidth: 2,
        spacing: spacing,
        values: const [0, 1],
        // 0 = English, 1 = Arabic
        onChanged: (index) {
          setState(() => currentIndex = index);
          index == 0
              ? languageProvider.changeLanguage('en')
              : languageProvider.changeLanguage('ar');
        },
        iconBuilder: (value, foreground) => ClipOval(
          child: Image.asset(
            value == 0 ? AppAssets.americaFlag : AppAssets.egyptFlag,
            fit: BoxFit.cover,
            width: indicatorSize,
            height: indicatorSize,
          ),
        ),
        iconsTappable: true,
        style: ToggleStyle(
          borderColor: AppColors.yellowColor,
          indicatorColor: AppColors.yellowColor,
          backgroundColor: AppColors.transparentColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        height: toggleHeight,
        indicatorSize: Size(indicatorSize, indicatorSize),
      ),
    );
  }
}

/*
  @override
  void initState() {
    super.initState();
    var languageProvider = Provider.of<AppLanguageProvider>(context, listen: false);
    currentIndex = languageProvider.isEnglish ? 0 : 1;
  }
 */
