import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  int selectedIndex = 0;
  void change(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }
}
