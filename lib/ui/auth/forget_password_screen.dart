import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_routes.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.forgetPasswordBg),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        controller: emailcontroller,
                        prefixIcon: ImageIcon(
                          const AssetImage(
                            AppAssets.emailIcon,
                          ),
                          color: Theme.of(context).canvasColor,
                        ),
                        hintText: AppLocalizations.of(context)!.email,
                        validator: emailValidator,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      CustomElevatedButton(
                          onPressed: forgetpassword,
                          text: AppLocalizations.of(context)!.verify_email)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  String? emailValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter your Email';
    }
    return null;
  }

  void forgetpassword() {
    if (_formKey.currentState!.validate() == true) {
      Navigator.pushNamed(context, AppRoutes.homeScreenRouteName);
    }
  }
}
