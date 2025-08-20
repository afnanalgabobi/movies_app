import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';
import 'package:movies_app/utils/app_assets.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.forget_password2),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.forgetPasswordBg),
            CustomTextFormField(
              controller: emailcontroller,
              prefixIcon: ImageIcon(
                const AssetImage(
                  AppAssets.emailIcon,
                ),
                color: Theme.of(context).canvasColor,
              ),
              hintText: AppLocalizations.of(context)!.email,
            ),
            SizedBox(
              height: size.height * .02,
            ),
            CustomElevatedButton(
                onPressed: () {},
                text: AppLocalizations.of(context)!.verify_email)
          ],
        ),
      ),
    );
  }
}
