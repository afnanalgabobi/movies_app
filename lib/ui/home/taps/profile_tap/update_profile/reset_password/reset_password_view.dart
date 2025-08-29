import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/home/taps/profile_tap/update_profile/reset_password/reset_password_validator/reset_password_validator.dart';
import 'package:movies_app/ui/update_profile/reset_passworf/cubit/reset_password_view_model.dart';
import 'package:movies_app/ui/widgets/custom_dialog.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordViewModel resetPasswordViewModel = ResetPasswordViewModel();

  _printTestToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("Token => $token");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _printTestToken();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<ResetPasswordViewModel>(
      create: (context) => resetPasswordViewModel,
      child: BlocConsumer<ResetPasswordViewModel, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordLSuccess) {
            DialogUtils.showMessage(
                context: context,
                message: state.message,
                posAction: () {
                  Navigator.pushNamed(
                      context, AppRoutes.updateProfileScreenRouteName);
                },
                posActionName: "Ok");

            print("State : ${state.message}");
          } else {
            if (state is ResetPasswordLError) {
              DialogUtils.showMessage(
                  context: context,
                  message: state.errorMessage,
                  posActionName: "Ok");
              print("State : ${state.errorMessage}");
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.reset_password),
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
                        key: resetPasswordViewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextFormField(
                                controller: resetPasswordViewModel
                                    .oldPasswordController,
                                prefixIcon: ImageIcon(
                                  const AssetImage(
                                    AppAssets.passwordIcon,
                                  ),
                                  color: Theme.of(context).canvasColor,
                                ),
                                hintText:
                                    AppLocalizations.of(context)!.old_password,
                                validator: (oldPassword) {
                                  return ResetPasswordValidator
                                      .oldPasswordValidator(
                                          oldPassword, context);
                                }),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            CustomTextFormField(
                              controller:
                                  resetPasswordViewModel.newPasswordController,
                              prefixIcon: ImageIcon(
                                const AssetImage(
                                  AppAssets.passwordIcon,
                                ),
                                color: Theme.of(context).canvasColor,
                              ),
                              hintText:
                                  AppLocalizations.of(context)!.new_password,
                              validator: (newPassword) {
                                ResetPasswordValidator.newPasswordValidator(
                                    newPassword, context);
                              },
                            ),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            CustomTextFormField(
                                controller: resetPasswordViewModel
                                    .confirmNewPasswordController,
                                prefixIcon: ImageIcon(
                                  const AssetImage(
                                    AppAssets.passwordIcon,
                                  ),
                                  color: Theme.of(context).canvasColor,
                                ),
                                hintText: AppLocalizations.of(context)!
                                    .confirm_new_password,
                                validator: (value) {
                                  return ResetPasswordValidator
                                      .confirmNewPasswordValidator(
                                          resetPasswordViewModel
                                              .newPasswordController.text
                                              .trim(),
                                          value?.trim(),
                                          context);
                                }),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            state is ResetPasswordLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: AppColors.yellowColor,
                                  ))
                                : CustomElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<ResetPasswordViewModel>()
                                          .resetPassword();
                                    },
                                    text: AppLocalizations.of(context)!
                                        .reset_password)
                          ],
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
