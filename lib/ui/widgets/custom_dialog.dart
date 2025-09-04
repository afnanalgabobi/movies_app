import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String loadingText}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).canvasColor,
        content: Row(
          children: [
            const CircularProgressIndicator(
              color: AppColors.grayColor,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                loadingText,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          ],
        ),
      ),
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      required String message,
      String? title,
      String? posActionName,
      Function? posAction,
      String? negActionName,
      Function? negAction,
      bool barrierDismissible = true}) {
    List<Widget>? actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: Theme.of(context).textTheme.titleLarge,
          )));
    }

    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(
            negActionName,
            style: Theme.of(context).textTheme.titleLarge,
          )));
    }
    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).canvasColor,
            content: Text(
              message,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            title: Text(
              title ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            actions: actions));
  }
}
