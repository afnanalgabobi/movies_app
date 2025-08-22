import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/avatarList.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';
import 'package:movies_app/ui/widgets/custom_toggle_switch.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ScrollController _scrollController = ScrollController();

  int currentIndex = 0;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double itemWidth = 120;
      int index = (offset / itemWidth).round();
      setState(() {
        currentIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.register)),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 160,
                child: ListView.separated(
                  controller: _scrollController,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: AvatarData.avatarList.length,
                  itemBuilder: (context, index) {
                    return CircleAvatar(
                      radius: index == currentIndex + 1 ? 75 : 45,
                      child: Image.asset(
                        AvatarData.avatarList[index],
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
              Text(
                AppLocalizations.of(context)!.avatar,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        controller: namecontroller,
                        prefixIcon: ImageIcon(
                          const AssetImage(
                            AppAssets.nameIcon,
                          ),
                          color: Theme.of(context).canvasColor,
                        ),
                        hintText: AppLocalizations.of(context)!.name,
                        validator: nameValidator,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
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
                      CustomTextFormField(
                        controller: passwordcontroller,
                        prefixIcon: ImageIcon(
                          const AssetImage(
                            AppAssets.passwordIcon,
                          ),
                          color: Theme.of(context).canvasColor,
                        ),
                        hintText:
                            AppLocalizations.of(context)!.confirm_password,
                        validator: confirmpasswordValidator,
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
                      CustomTextFormField(
                        controller: phonecontroller,
                        prefixIcon: ImageIcon(
                          const AssetImage(
                            AppAssets.phoneIcon,
                          ),
                          color: Theme.of(context).canvasColor,
                        ),
                        hintText: AppLocalizations.of(context)!.phone_number,
                        validator: phoneValidator,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      CustomElevatedButton(
                          onPressed: register,
                          text: AppLocalizations.of(context)!.create_account),
                    ],
                  )),
              SizedBox(
                height: size.height * .02,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: AppLocalizations.of(context)!.already_have_account,
                      style: Theme.of(context).textTheme.titleSmall,
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.loginScreenRouteName);
                              },
                            text: AppLocalizations.of(context)!.login,
                            style: AppStylesRoboto.regular14Yellow),
                      ])),
              SizedBox(
                height: size.height * .02,
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

  String? nameValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? phoneValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter your phone';
    }
    return null;
  }

  String? confirmpasswordValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? passwordValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void register() {
    if (_formKey.currentState!.validate() == true) {
      Navigator.pushNamed(context, AppRoutes.homeScreenRouteName);
    }
  }
}
