import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/avatarList.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/auth/register_auth/widgets/validation_methods.dart';
import 'package:movies_app/ui/home/taps/profile_tap/widget/avatar_custom_bottom_sheet.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/dialogue_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles_roboto.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../cubit/profile_states.dart';
import '../cubit/profile_view_model.dart';
import '../model/profile_model.dart';
import '../model/update_profile_request.dart';

class UpdateProfilesScreen extends StatefulWidget {
  const UpdateProfilesScreen({required this.profileModel, super.key});

  final ProfileModel profileModel;

  @override
  State<UpdateProfilesScreen> createState() => _UpdateProfilesScreenState();
}

class _UpdateProfilesScreenState extends State<UpdateProfilesScreen> {
  int selectedAvatarIndex = 0;
  final TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProfileViewModel viewModel = ProfileViewModel();

  @override
  void initState() {
    super.initState();
    selectedAvatarIndex = widget.profileModel.avaterId ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider<ProfileViewModel>(
      create: (context) => viewModel,
      child: BlocListener<ProfileViewModel, ProfileStates>(
        listener: (context, state) {
          print('state changed: $state');
          if (state is UpdateProfileLoadingState) {
            DialogUtils.showLoadingDialog("Loading ....", context);
          } else {
            DialogUtils.hideDialog(context);
          }
          if (state is UpdateProfileErrorState) {
            DialogUtils.showDialogMessage(context,
                message: 'Failed ${state.errorMessage}',
                posActionTitle: 'Try Again');
          } else if (state is UpdateProfileSuccessState) {
            DialogUtils.hideDialog(context);
            DialogUtils.showDialogMessage(
              context,
              message: 'Updating Successfully',
              posActionTitle: 'ok',
              posAction: () {
                Navigator.pushNamed(context, AppRoutes.profileScreenRouteName);
              },
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.037,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: size.height * 0.04),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return AvatarCustomBottomSheet(
                            onAvatarSelected: (index) {
                              setState(() {
                                selectedAvatarIndex = index;
                              });
                            },
                            selectedAvatarIndex: selectedAvatarIndex);
                      },
                    );
                  },
                  child: Center(
                    child: Image.asset(
                      AvatarData.avatarList[selectedAvatarIndex],
                      width: size.width * 0.34,
                      height: size.height * 0.16,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFormField(
                  controller: nameController,
                  hintText: AppLocalizations.of(context)!.name,
                  prefixIcon: Image.asset(AppAssets.nameIcon),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) =>
                      ValidationMethods.nameValidator(email, context),
                ),
                SizedBox(height: size.height * 0.03),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: AppLocalizations.of(context)!.password,
                  prefixIcon: Image.asset(AppAssets.passwordIcon),
                  validator: (email) =>
                      ValidationMethods.nameValidator(email, context),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.018),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRoutes.resetPasswordScreenRouteName);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.reset_password,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                const Spacer(),
                BlocListener<ProfileViewModel, ProfileStates>(
                  listener: (context, state) {
                    if (state is DeleteProfileLoadingState) {
                      DialogUtils.showLoadingDialog("Loading ....", context);
                    } else {
                      DialogUtils.hideDialog(context);
                    }
                    if (state is DeleteProfileErrorState) {
                      DialogUtils.showDialogMessage(context,
                          message: 'Failed ${state.errorMessage}',
                          posActionTitle: 'Try Again');
                    } else if (state is DeleteProfileSuccessState) {
                      DialogUtils.hideDialog(context);
                      DialogUtils.showDialogMessage(
                        context,
                        message: state.message,
                        posActionTitle: 'ok',
                        posAction: () {
                          Navigator.pushNamed(
                              context, AppRoutes.loginScreenRouteName);
                        },
                      );
                    }
                  },
                  child: CustomElevatedButton(
                    onPressed: () async {
                      await context.read<ProfileViewModel>().deleteProfile();
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('token', "");
                      Navigator.pushNamed(
                          context, AppRoutes.loginScreenRouteName);
                    },
                    text: AppLocalizations.of(context)!.delete_account,
                    textStyle: AppStylesRoboto.regular20White,
                    backgroundColor: AppColors.redColor,
                    borderColor: AppColors.transparentColor,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                CustomElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await context.read<ProfileViewModel>().updateProfile(
                            UpdateProfileRequest(
                              email: nameController.text,
                              avaterId: selectedAvatarIndex,
                            ),
                          );
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.profileScreenRouteName,
                      );
                    }
                  },
                  text: AppLocalizations.of(context)!.update_data,
                  textStyle: AppStylesRoboto.regular20Black,
                ),
                SizedBox(
                  height: size.height * 0.016,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
