import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/onboarding_provider.dart';
import '../../utils/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  String title;
  String? subTitle;
  int nextButton;
  int? backButton;

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

    return BottomSheet(
      clipBehavior: Clip.antiAlias,
      backgroundColor: AppColors.grayColor,
      dragHandleSize: Size(double.infinity, 100),
      onClosing: () {},
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: Column(
            spacing: height * 0.02,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineMedium),
              Text(
                subTitle ?? '' ,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              CustomElevatedButton(
                onPressed: () {
                  nextButton != 6 ?
                  onBoardingProvider.change(nextButton):
                  Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreenRouteName);
                },
                text: onBoardingProvider.selectedIndex != 5
                    ? AppLocalizations.of(context)!.next
                    : AppLocalizations.of(context)!.finish,
                textStyle: Theme.of(context).textTheme.headlineMedium,
              ),
              nextButton != 1 && nextButton != 2 && backButton != -1
                  ? CustomElevatedButton(
                onPressed: () {
                  onBoardingProvider.change(
                    backButton ?? onBoardingProvider.selectedIndex,
                  );
                },
                text: AppLocalizations.of(context)!.back,
                textStyle: Theme.of(context).textTheme.headlineMedium,
                backgroundColor: AppColors.transparentColor,
                borderColor: AppColors.yellowColor,
              )
                  : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}

