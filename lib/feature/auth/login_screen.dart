import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppAssets.logoImage),
          Text(
            AppLocalizations.of(context)!.forget_password,
            style: AppStylesRoboto.regular14Yellow,
          ),
          RichText(
              text: TextSpan(
                  text: 'Don’t Have Account ? ',
                  style: AppStylesRoboto.regular14White,
                  children: [
                TextSpan(
                    text: 'Create One', style: AppStylesRoboto.regular14Yellow),
              ])),
          Row(
            children: [
              const Expanded(
                  child: Divider(
                color: AppColors.yellowColor,
                endIndent: 10,
                indent: 60,
              )),
              Text(
                AppLocalizations.of(context)!.or,
                style: AppStylesRoboto.regular15Yellow,
              ),
              const Expanded(
                  child: Divider(
                color: AppColors.yellowColor,
                endIndent: 60,
                indent: 10,
              )),
            ],
          )
        ],
      ),
    );
  }
}
