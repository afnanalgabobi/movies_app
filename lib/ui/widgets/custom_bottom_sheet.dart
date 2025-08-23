import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles_inter.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/app_theme_provider.dart';
import '../../providers/onBoarding_Provider.dart';
import '../../utils/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  String title;
  String? subTitle;
  int nextButton;
  int? backButton;
  Color? backgroundColor;

  CustomBottomSheet({
    super.key,
    required this.title,
    this.subTitle,
    required this.nextButton,
    this.backButton,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var onBoardingProvider = Provider.of<OnBoardingProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Provider<OnBoardingProvider>(
        create: (_) => OnBoardingProvider(),
        child: BottomSheet(
          clipBehavior: Clip.antiAlias,
          backgroundColor: nextButton == 1
              ? AppColors.transparentColor
              : Theme.of(context).primaryColor,
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: Column(
                //   spacing: height * 0.02,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    subTitle ?? '',
                    style: themeProvider.isDarkMode()
                        ? Theme.of(context).textTheme.headlineMedium
                        : Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      nextButton != 6
                          ? onBoardingProvider.change(nextButton)
                          : Navigator.of(context).pushReplacementNamed(
                              AppRoutes.loginScreenRouteName);
                    },
                    text: onBoardingProvider.selectedIndex != 5
                        ? AppLocalizations.of(context)!.next
                        : AppLocalizations.of(context)!.finish,
                    textStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                  nextButton != 1 && nextButton != 2 && backButton != -1
                      ? CustomElevatedButton(
                          onPressed: () {
                            onBoardingProvider.change(
                              backButton ?? onBoardingProvider.selectedIndex,
                            );
                          },
                          text: AppLocalizations.of(context)!.back,
                          textStyle: AppStylesInter.semibold20Yellow,
                          backgroundColor: AppColors.transparentColor,
                          borderColor: AppColors.yellowColor,
                        )
                      : SizedBox(),
                  SizedBox(
                    height: height * 0.02,
                  )
                ],
              ),
            );
          },
        ));
  }
}
