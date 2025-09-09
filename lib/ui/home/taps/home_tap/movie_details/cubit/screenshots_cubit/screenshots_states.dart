class ScreenshotsStates {}

class InitialScreenshotsStates extends ScreenshotsStates {}

class LoadingScreenshotsStates extends ScreenshotsStates {}

class ErrorScreenshotsStates extends ScreenshotsStates {
  String? errorMassage;
  ErrorScreenshotsStates({required this.errorMassage});
}

class SuccessScreenshotsStates extends ScreenshotsStates {
  List<String>? screenshotsList;
  SuccessScreenshotsStates({required this.screenshotsList});
}