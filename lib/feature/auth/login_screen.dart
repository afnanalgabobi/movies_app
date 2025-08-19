import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppAssets.logoImage),
        ],
      ),
    );
  }
}
