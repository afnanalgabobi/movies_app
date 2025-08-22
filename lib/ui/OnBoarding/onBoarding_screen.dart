import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/providers/app_theme_provider.dart';
import 'package:movies_app/ui/widgets/custom_bottom_sheet.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../data/OnBoardingBGList.dart';
import '../../providers/onBoarding_Provider.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> onBoardingBGList = OnBoardingData.onBoardingBGList;
  List<LinearGradient> onboardingGradient = OnBoardingData.onboardingGradient;
  List<LinearGradient> onboardingGradientLight = OnBoardingData.onboardingGradientLight;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var onBoardingProvider = Provider.of<OnBoardingProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    List<String> onBoardingTitlesList = [
      AppLocalizations.of(context)!.onboarding_title_screen1,
      AppLocalizations.of(context)!.onboarding_title_screen2,
      AppLocalizations.of(context)!.onboarding_title_screen3,
      AppLocalizations.of(context)!.onboarding_title_screen4,
      AppLocalizations.of(context)!.onboarding_title_screen5,
      AppLocalizations.of(context)!.onboarding_title_screen6,
    ];

    List<String> onBoardingSubTitlesList = [
      AppLocalizations.of(context)!.onboarding_subtitle_screen1,
      AppLocalizations.of(context)!.onboarding_subtitle_screen2,
      AppLocalizations.of(context)!.onboarding_subtitle_screen3,
      AppLocalizations.of(context)!.onboarding_subtitle_screen4,
      AppLocalizations.of(context)!.onboarding_subtitle_screen5,
      '',
    ];

    List<int> onBoardingNextFnList = [1, 2, 3, 4, 5, 6];
    List<int> onBoardingBackFnList = [5, -1, 1, 2, 3, 4];

    return Scaffold(
        backgroundColor: AppColors.transparentColor,
        body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        onBoardingBGList[onBoardingProvider.selectedIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: !themeProvider.isDarkMode()?
                    onboardingGradient[onBoardingProvider.selectedIndex]
                        : onboardingGradientLight[onBoardingProvider.selectedIndex]
                ),
              ),
              CustomBottomSheet(
                title: onBoardingTitlesList[onBoardingProvider.selectedIndex],
                subTitle: onBoardingSubTitlesList[onBoardingProvider.selectedIndex],
                nextButton: onBoardingNextFnList[onBoardingProvider.selectedIndex],
                backButton: onBoardingBackFnList[onBoardingProvider.selectedIndex],
              ),
            ], ),
        );
    }
}
