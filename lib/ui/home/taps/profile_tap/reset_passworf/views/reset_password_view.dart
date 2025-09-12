import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/widgets/custom_dialog.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../model/user_model/shared_preference.dart';
import '../cubit/reset_password_view_model.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordViewModel resetPasswordViewModel = ResetPasswordViewModel();

  _printTestToken() async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    var token = await AppPreferences.getUserToken();

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

                  Future.delayed(
                    Duration(microseconds: 500),
                        () {
                      DialogUtils.showMessage(
                        context:context,
                        message:  state.message,
                        posActionName: 'ok',
                        posAction: (){
                          Navigator.pop(context);
                        },);
                    },
                  );

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
                              controller:
                                  resetPasswordViewModel.oldPasswordController,
                              prefixIcon: ImageIcon(
                                const AssetImage(
                                  AppAssets.passwordIcon,
                                ),
                                color: Theme.of(context).canvasColor,
                              ),
                              hintText:
                                  AppLocalizations.of(context)!.old_password,
                              validator: oldPasswordValidator,
                            ),
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
                              validator: newPasswordValidator,
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
                                  return confirmNewPasswordValidator(
                                      resetPasswordViewModel
                                          .newPasswordController.text
                                          .trim(),
                                      value?.trim());
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

  String? oldPasswordValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.enter_your_old_pass;
    }
    return null;
  }

  String? newPasswordValidator(String? input) {
    bool isStrongPassword =
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$').hasMatch(
      input!,
    );
    if (input.trim().isEmpty) {
      return AppLocalizations.of(context)!.enter_your_new_pass;
    } else if (input.trim().length < 8) {
      return AppLocalizations.of(context)!.pass_more_than_8;
    } else if (!isStrongPassword) {
      return AppLocalizations.of(context)!.pass_reg_ex;
    }
    return null;
  }

  String? confirmNewPasswordValidator(String? input1, String? input2) {
    if (input1 == null || input1.trim().isEmpty) {
      return AppLocalizations.of(context)!.enter_your_confirm_new_pass;
    }
    if (input1.trim() != input2?.trim()) {
      return AppLocalizations.of(context)!.pass_do_not_match;
    }
    return null;
  }
}
