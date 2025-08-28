import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';

class ValidationMethods {
  static String? nameValidator(String? name, BuildContext context) {
    if (name == null || name.trim().isEmpty) {
      return AppLocalizations.of(context)!.enter_your_name;
    } else if (name.length < 3) {
      return AppLocalizations.of(context)!.name_must_be_more_than_2_character;
    }
    return null;
  }

  static String? emailValidator(String? email, BuildContext context) {
    final bool isValid =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
            .hasMatch(email!);
    if (email.trim().isEmpty) {
      return AppLocalizations.of(context)!.enter_your_email;
    } else if (!isValid) {
      return AppLocalizations.of(context)!.please_enter_valid_email;
    }
    return null;
  }

  static String? passwordValidator(String? password, BuildContext context) {
    bool isStrongPassword =
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$').hasMatch(
      password!,
    );
    if (password.trim().isEmpty) {
      return AppLocalizations.of(context)!.enter_your_pass;
    } else if (password.trim().length < 8) {
      return AppLocalizations.of(context)!.pass_more_than_8;
    } else if (!isStrongPassword) {
      return AppLocalizations.of(context)!.pass_reg_ex;
    }
    return null;
  }

  static String? confirmPasswordValidator(String? confirmPassword,
      TextEditingController textEditingController, BuildContext context) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return AppLocalizations.of(context)!.enter_re_pass;
    }
    if (confirmPassword != textEditingController.text) {
      return AppLocalizations.of(context)!.pass_do_not_match;
    }
    return null;
  }

  static String? egyptianPhoneNumberValidator(
      String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.enter_your_phone;
    }

    //todo: Ensure the number starts with +20
    if (!value.startsWith("+20")) {
      return AppLocalizations.of(context)!.phone_number_must_start_with;
    }

    //todo: Remove the "+20" prefix for further validation
    String numberWithoutCode = value.substring(3); // Remove +20

    //todo: Egyptian mobile number regex (must start with 010, 011, 012, or 015 and have 8 more digits)
    final RegExp egyptianPhoneRegex = RegExp(r'^(10|11|12|15)[0-9]{8}$');
    if (!egyptianPhoneRegex.hasMatch(numberWithoutCode)) {
      return AppLocalizations.of(context)!.egyptian_mobile_number_example;
    }
    return null;
  }
}
