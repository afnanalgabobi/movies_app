import 'package:flutter/material.dart';

class AppGradient {
  static const LinearGradient blackGradient = LinearGradient(
    colors: [Colors.transparent, Color(0xFF121312)],
    stops: [0.1, 0.9],
    begin: FractionalOffset.bottomCenter,
    end: FractionalOffset.topCenter,
  );
  static const LinearGradient greenGradient = LinearGradient(
    colors: [Colors.transparent, Color(0xFF084250)],
    stops: [0.1, 0.9],
    begin: FractionalOffset.bottomCenter,
    end: FractionalOffset.topCenter,
  );
  static const LinearGradient redGradient = LinearGradient(
    colors: [Colors.transparent, Color(0xFF85210E)],
    stops: [0.1, 0.9],
    begin: FractionalOffset.bottomCenter,
    end: FractionalOffset.topCenter,
  );
  static const LinearGradient purbleGradient = LinearGradient(
    colors: [Colors.transparent, Color(0xFF4C2471)],
    stops: [0.1, 0.9],
    begin: FractionalOffset.bottomCenter,
    end: FractionalOffset.topCenter,
  );
  static const LinearGradient burgundyGradient = LinearGradient(
    colors: [Colors.transparent, Color(0xFF601321)],
    stops: [0.1, 0.9],
    begin: FractionalOffset.bottomCenter,
    end: FractionalOffset.topCenter,
  );
  static const LinearGradient grayGradient = LinearGradient(
    colors: [Colors.transparent, Color(0xFF2A2C30)],
    stops: [0.1, 0.9],
    begin: FractionalOffset.bottomCenter,
    end: FractionalOffset.topCenter,
    // begin: Alignment.topCenter,
    // end: Alignment.bottomCenter,
  );
}
