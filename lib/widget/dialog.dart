import 'package:bybug/theme/color.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter/material.dart';

class ByBugDialg {
  static void showStory(BuildContext context, BoxConstraints constraints,
      String title, String text) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      backgroundColor: ThemeColors().backgroundColor,
      textColor: Colors.white,
      titleColor: Colors.white,
      barrierColor: Colors.transparent,
      confirmBtnColor: ThemeColors().backgroundColor,
      width: constraints.maxWidth / 3,
      title: title,
      text: text,
      customAsset: "assets/images/bybug_stories.jpg",
      confirmBtnText: "Devam Et!",
    );
  }

  static void showSuccessful(BuildContext context, BoxConstraints constraints,
      String title, String text) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      backgroundColor: ThemeColors().backgroundColor,
      textColor: Colors.white,
      titleColor: Colors.white,
      barrierColor: Colors.transparent,
      confirmBtnColor: ThemeColors().backgroundColor,
      width: constraints.maxWidth / 3,
      title: title,
      text: text,
      // customAsset: "assets/images/bybug_stories.jpg",
      confirmBtnText: "Kapat",
    );
  }
}
