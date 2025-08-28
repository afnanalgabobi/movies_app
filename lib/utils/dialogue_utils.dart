import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static showLoadingDialog(String? loadingMessage, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Row(
            children: [
              Text(
                loadingMessage ?? "",
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              const CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }

  static hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showDialogMessage(BuildContext context,
      {required String message,
      String? title,
      String? posActionTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction}) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionTitle,
            style: const TextStyle(fontSize: 16),
          )));
    }
    if (negActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(
            negActionTitle,
            style: const TextStyle(fontSize: 16),
          )));
    }
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
          title: title != null
              ? Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                )
              : null,
          actions: actions,
        );
      },
    );
  }
}
