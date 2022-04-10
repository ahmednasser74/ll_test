import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ll_test/core/src/assets.dart';
import 'package:ll_test/core/src/routes.dart';
import 'package:ll_test/core/utils/pref_util.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        if (SharedPrefs.instance.getIsUserLogin()) {
          Get.offAndToNamed(Routes.movieScreen);
        } else {
          Get.offAndToNamed(Routes.loginScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'marvel_logo_hero',
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(Assets.appIcon, width: .70.sw),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: .10.sh),
              child: Text(
                'Welcome To Marvel World.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
