import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';

import '../utils/app_gradients.dart';

class OnBoardingData{
  static List<String> onBoardingBGList = [
    AppAssets.onboardingImage1,
    AppAssets.onboardingImage2,
    AppAssets.onboardingImage3,
    AppAssets.onboardingImage4,
    AppAssets.onboardingImage5,
    AppAssets.onboardingImage6,
  ];

  static List<LinearGradient> onboardingGradient = [
    AppGradient.blackGradient,
    AppGradient.greenGradient,
    AppGradient.redGradient,
    AppGradient.purbleGradient,
    AppGradient.burgundyGradient,
    AppGradient.grayGradient,
  ];
}