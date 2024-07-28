import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gd/core/constants/lotties_path.dart';
import 'package:gd/generated/locale_keys.g.dart';
import 'package:lottie/lottie.dart';

class AppAlerts {
  waring(
      {required BuildContext context, VoidCallback? onPressed, String? title}) {
    Widget continueButton = TextButton(
      onPressed: onPressed,
      child: Text(
        LocaleKeys.kOk.tr(),
        style: const TextStyle(color: Colors.blue),
      ),
    );
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Lottie.asset(LottiesPath.wrong, width: 80, height: 80),
          const SizedBox(height: 20),
          Text(title ?? LocaleKeys.kSomethingWentWrong.tr())
        ],
      ),
      actions: [
        continueButton,
      ],
    );
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog(
      {required BuildContext context,
      VoidCallback? onPressed,
      VoidCallback? onPressCancel,
      required String title,
      required String detail}) {
    Widget continueButton = TextButton(
      onPressed: onPressed,
      child: Text(
        LocaleKeys.kOk.tr(),
        style: const TextStyle(color: Colors.blue),
      ),
    );
    AlertDialog alert = AlertDialog(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title),
        ],
      ),
      content: Text(detail),
      actions: [
        // cancelButton,
        continueButton,
      ],
    );
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogLogin(
      {required BuildContext context,
      VoidCallback? onPressed,
      // onPressCancel,
      required String title,
      required String detail}) {
    // set up the buttons
    Widget cancelButton = TextButton(
        // style: TextButton.styleFrom(backgroundColor: Colors.black12),
        onPressed: () => Navigator.pop(context),
        // style: TextButton.styleFrom(backgroundColor: Colors.black12),
        child: Text(LocaleKeys.kCancel.tr(),
            style: const TextStyle(color: Colors.blue)));
    Widget continueButton = TextButton(
      // style: TextButton.styleFrom(backgroundColor: Colors.blue),
      onPressed: onPressed,
      // style: TextButton.styleFrom(backgroundColor: Colors.blue),
      child: Text(
        LocaleKeys.kLogin.tr(),
        style: const TextStyle(color: Colors.blue),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Icon(Icons.lock),
          Text(title),
        ],
      ),
      content: Text(detail),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
