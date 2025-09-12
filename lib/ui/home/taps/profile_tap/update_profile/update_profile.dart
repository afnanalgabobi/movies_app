import 'package:flutter/material.dart';
import 'package:movies_app/data/avatarList.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/OnBoarding/onBoarding_screen.dart';
import 'package:movies_app/ui/home/taps/profile_tap/update_profile/widgets/build_bottomSheet.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../model/register_model/user_data.dart';
import '../../../../../utils/app_routes.dart';
import '../../../../../utils/dialogue_utils.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../cubit/profile_view_model.dart';

class UpdateProfile extends StatefulWidget {
  var avatarList = AvatarData.avatarList;
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var avatarList = AvatarData.avatarList;
  var viewModel;
  int selectedAvatarIndex = 0;
  var _formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    List info = ModalRoute.of(context)!.settings.arguments as List;
    UserData user = info[0];
    viewModel = info[1];
    print(viewModel.currentProfile);

    userNameController.text = user.name;
    phoneController.text = user.phone;


    void onChooseAvatar(int index) {
      setState(() {

      });
    }

    return Scaffold(
        appBar: CustomAppBar(title: AppLocalizations.of(context)!.pick_avatar),
        body: Padding(
            padding: EdgeInsets.only(
              left: width * 0.04,
              right: width * 0.04,
              top: height * 0.02,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Theme.of(context).dividerColor,
                        context: context,
                        builder: (context) {
                          return BuildBottomSheet(
                            onChooseAvatar: onChooseAvatar,
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: AppColors.transparentColor,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.asset(
                            avatarList[context.read<ProfileCubit>().selectedAvatar],
                            height: height * 0.4,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: width * 0.05,
                            child: Container(
                              padding: EdgeInsets.all(height * 0.006),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.lightGrayColor,
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Form(
                    key: _formKey,
                    child: Column(
                      //  spacing: height * 0.02,
                      children: [
                        CustomTextFormField(
                          controller: userNameController,
                          prefixIcon: Image.asset(AppAssets.userIcon),
                          hintText: userNameController.text,
                          validator: userNameValidator,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextFormField(
                          controller: phoneController,
                          prefixIcon: Image.asset(AppAssets.phoneIcon),
                          hintText: phoneController.text,
                          validator: phoneValidator,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  GestureDetector(
                    child: Text(
                      AppLocalizations.of(context)!.reset_password,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRoutes.resetPasswordScreenRouteName);
                    },
                  ),
                  SizedBox(height: height * 0.04),

                  CustomElevatedButton(
                    onPressed: (){deleteProfile();},
                    text: AppLocalizations.of(context)!.delete_account,
                    textStyle: AppStylesRoboto.regular20White,
                    backgroundColor: AppColors.redColor,
                    borderColor: AppColors.transparentColor,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomElevatedButton(
                    onPressed: updateProfile,
                    text: AppLocalizations.of(context)!.update_data,
                    textStyle: AppStylesRoboto.regular20Black,
                  ),
                ],
              ),
            )));
  }

  String? userNameValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter your user name';
    }
    return null;
  }

  String? phoneValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }

  void updateProfile()async {
    if (_formKey.currentState!.validate() == true) {
      await viewModel.updateProfile(userNameController.text,
          context.read<ProfileCubit>().selectedAvatar, phoneController.text);

      Future.delayed(
        Duration(microseconds: 500),
            () {
          DialogUtils.showDialogMessage(context,
            message: 'user updated',
            posActionTitle: 'ok',
            posAction: (){
              Navigator.pushNamed(context, AppRoutes.profileTabRouteName);
            },);
        },
      );
    }
  }
  void deleteProfile() async {
    await viewModel.deleteProfile();

    Future.delayed(
      Duration(microseconds: 500),
          () {
        DialogUtils.showDialogMessage(context,
          message: 'user deleted',
          posActionTitle: 'ok',
          posAction: () {
            Navigator.pushReplacementNamed(
                context, AppRoutes.onboardingScreenRouteName);
          },);
      },
    );

  }
// Future ChooseAvatarBottomSheet() {
//   var height = MediaQuery.sizeOf(context).height;
//   var width = MediaQuery.sizeOf(context).width;
//
//   return showModalBottomSheet(
//     backgroundColor: AppColors.grayColor,
//     context: context,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//     ),
//     builder: (context) {
//       return Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: width * 0.04,
//           vertical: height * 0.02,
//         ),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             crossAxisSpacing: height * 0.02,
//             mainAxisSpacing: height * 0.02,
//           ),
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () {
//                 selectedAvatarIndex = index;
//                 setState(() {});
//                 print(selectedAvatarIndex);
//               },
//               child: Container(
//                 padding: EdgeInsets.all(height * 0.006),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Theme.of(context)!.canvasColor),
//                   borderRadius: BorderRadius.circular(32),
//                   color: selectedAvatarIndex == index
//                       ? AppColors.yellowColor
//                       : AppColors.transparentColor,
//                 ),
//                 child: CircleAvatar(
//                   backgroundColor: AppColors.transparentColor,
//                   child: Image.asset(
//                     widget.avatarList[index],
//                     height: height * 0.2,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             );
//           },
//           itemCount: widget.avatarList.length,
//         ),
//       );
//     },
//   );
// }
}
