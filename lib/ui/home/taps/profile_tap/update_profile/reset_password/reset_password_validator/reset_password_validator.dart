import 'package:flutter/cupertino.dart';

import '../../../../../../../l10n/app_localizations.dart';

class ResetPasswordValidator {
  static String? oldPasswordValidator(String? input, BuildContext context) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.enter_your_old_pass;
    }
    return null;
  }

  static String? newPasswordValidator(String? input, BuildContext context) {
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

  static String? confirmNewPasswordValidator(
      String? input1, String? input2, BuildContext context) {
    if (input1 == null || input1.trim().isEmpty) {
      return AppLocalizations.of(context)!.enter_your_confirm_new_pass;
    }
    if (input1.trim() != input2?.trim()) {
      return AppLocalizations.of(context)!.pass_do_not_match;
    }
    return null;
  }
}
