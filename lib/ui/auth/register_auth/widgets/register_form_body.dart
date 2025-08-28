import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/model/register_request.dart';
import 'package:movies_app/providers/app_Language_Provider.dart';
import 'package:movies_app/ui/auth/register_auth/cubit/register_states.dart';
import 'package:movies_app/ui/auth/register_auth/cubit/register_view_model.dart';
import 'package:movies_app/ui/auth/register_auth/widgets/validation_methods.dart';
import 'package:movies_app/ui/widgets/custom_elevated_button.dart';
import 'package:movies_app/ui/widgets/custom_language_toggle_switch.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';
import 'package:provider/provider.dart';

class RegisterFormBody extends StatefulWidget {
  int selectedAvatarId = 0;

  RegisterFormBody({super.key, required this.selectedAvatarId});

  @override
  State<RegisterFormBody> createState() => _RegisterFormBodyState();
}

class _RegisterFormBodyState extends State<RegisterFormBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  int languageValue = 0;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    Size size = MediaQuery.of(context).size;
    return BlocProvider<RegisterViewModel>(
      create: (context) => viewModel,
      child: BlocConsumer<RegisterViewModel, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        "${AppLocalizations.of(context)!.welcome} ${state.user.name}!")),
              );
              Navigator.pushReplacementNamed(
                  context, AppRoutes.homeScreenRouteName);
              // Navigate to home or login screen
            } else if (state is RegisterErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          }, builder: (context, state) {
        if (state is RegisterLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Expanded(
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      prefixIcon: ImageIcon(
                        const AssetImage(
                          AppAssets.nameIcon,
                        ),
                        color: Theme.of(context).canvasColor,
                      ),
                      hintText: AppLocalizations.of(context)!.name,
                      textCapitalization: TextCapitalization.words,
                      validator: (name) {
                        return ValidationMethods.nameValidator(name, context);
                      },
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      prefixIcon: ImageIcon(
                        const AssetImage(
                          AppAssets.emailIcon,
                        ),
                        color: Theme.of(context).canvasColor,
                      ),
                      hintText: AppLocalizations.of(context)!.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        return ValidationMethods.emailValidator(email, context);
                      },
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      prefixIcon: ImageIcon(
                        const AssetImage(
                          AppAssets.passwordIcon,
                        ),
                        color: Theme.of(context).canvasColor,
                      ),
                      hintText: AppLocalizations.of(context)!.password,
                      validator: (confirmPassword) {
                        return ValidationMethods.passwordValidator(
                            confirmPassword, context);
                      },
                      isPassword: true,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      prefixIcon: ImageIcon(
                        const AssetImage(
                          AppAssets.passwordIcon,
                        ),
                        color: Theme.of(context).canvasColor,
                      ),
                      hintText: AppLocalizations.of(context)!.confirm_password,
                      validator: (confirmPassword) {
                        return ValidationMethods.confirmPasswordValidator(
                            confirmPassword, passwordController, context);
                      },
                      isPassword: true,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    CustomTextFormField(
                      controller: phoneController,
                      prefixIcon: ImageIcon(
                        const AssetImage(
                          AppAssets.phoneIcon,
                        ),
                        color: Theme.of(context).canvasColor,
                      ),
                      hintText: AppLocalizations.of(context)!.phone_number,
                      textInputFormatter: FilteringTextInputFormatter.allow(
                        RegExp(r'^\+?(010|011|012|015)?[0-9]{0,15}$'),
                      ),
                      validator: (phone) {
                        return ValidationMethods.egyptianPhoneNumberValidator(
                            phone, context);
                      },
                      isPassword: false,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final request = RegisterRequest(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              phone: phoneController.text,
                              avaterId: widget.selectedAvatarId,
                            );
                            context.read<RegisterViewModel>().register(request);
                          }
                        },
                        text: AppLocalizations.of(context)!.create_account),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: AppLocalizations.of(context)!
                                .already_have_account,
                            style: Theme.of(context).textTheme.titleSmall,
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacementNamed(context,
                                          AppRoutes.loginScreenRouteName);
                                    },
                                  text: AppLocalizations.of(context)!.login,
                                  style: AppStylesRoboto.regular14Yellow),
                            ])),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    CustomLanguageToggleSwitch(),
                  ],
                )),
          ),
        );
      }),
    );
  }
}