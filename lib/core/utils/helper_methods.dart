import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../src/colors.dart';

class HelperMethods {
  static showToast({
    required String msg,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Toast toastLength = Toast.LENGTH_SHORT,
    Color backgroundColor = CustomColors.primaryColor,
    Color textColor = CustomColors.whiteColor,
    double fontSize = 16,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: gravity,
      fontSize: fontSize,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  static Future<void> launchToBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      HelperMethods.showToast(msg: 'Could not go to this url');
      throw 'Could not launch $url';
    }
  }

  static Widget onCacheImageLoading(
    BuildContext context,
    String string,
  ) =>
      Container(
        margin: EdgeInsets.symmetric(horizontal: .5.sw, vertical: 10),
        child: CircularProgressIndicator(
          color: CustomColors.primaryColor,
          backgroundColor: Colors.transparent,
        ),
      );
}
