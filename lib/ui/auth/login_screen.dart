import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';
import 'package:movies_app/ui/widgets/custom_toggle_switch.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .04, vertical: size.height * .07),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.logoImage,
                width: size.width * .28,
                height: size.height * .12,
              ),
              SizedBox(
                height: size.height * .07,
              ),
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
                      CustomTextFormField(
                        controller: passwordcontroller,
                        prefixIcon: ImageIcon(
                          const AssetImage(
                            AppAssets.passwordIcon,
                          ),
                          color: Theme.of(context).canvasColor,
                        ),
                        hintText: AppLocalizations.of(context)!.password,
                        validator: passwordValidator,
                        suffixIcon: ImageIcon(
                          const AssetImage(
                            AppAssets.eyeoffIcon,
                          ),
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              AppRoutes.forgetPasswordScreenRouteName);
                        },
                        child: Text(
                          textAlign: TextAlign.end,
                          AppLocalizations.of(context)!.forget_password,
                          style: AppStylesRoboto.regular14Yellow,
                        ),
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      CustomElevatedButton(
                          onPressed: login,
                          text: AppLocalizations.of(context)!.login),
                    ],
                  )),
              SizedBox(
                height: size.height * .02,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: AppLocalizations.of(context)!.do_not_have_account,
                      style: Theme.of(context).textTheme.titleSmall,
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, AppRoutes.registerScreenRouteName);
                              },
                            text: AppLocalizations.of(context)!.create_one,
                            style: AppStylesRoboto.regular14Yellow),
                      ])),
              SizedBox(
                height: size.height * .02,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: AppColors.yellowColor,
                    endIndent: size.width * .03,
                    indent: size.width * .2,
                  )),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: AppStylesRoboto.regular15Yellow,
                  ),
                  Expanded(
                      child: Divider(
                    color: AppColors.yellowColor,
                    endIndent: size.width * .2,
                    indent: size.width * .03,
                  )),
                ],
              ),
              SizedBox(
                height: size.height * .02,
              ),
              CustomElevatedButton(
                  onPressed: () {},
                  mainAxisAlignment: MainAxisAlignment.center,
                  icon: true,
                  iconWidget: ImageIcon(
                    const AssetImage(
                      AppAssets.googleIcon,
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  text: AppLocalizations.of(context)!.login_with_google),
              SizedBox(
                height: size.height * .03,
              ),
              const CustomToggleSwitch(),
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

  String? passwordValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void login() {
    if (_formKey.currentState!.validate() == true) {
      Navigator.pushNamed(context, AppRoutes.homeScreenRouteName);
    }
  }
}
