import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class CustomsThemes {
  CustomsThemes();

  static final defaultThemeData = ThemeData(
    /// Dialog Color
    colorScheme: ColorScheme.light(
      primary: CustomColors.blackColor,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    primaryColor: CustomColors.primaryColor,
    accentColor: CustomColors.blackColor,

    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: CustomColors.primaryColor,
    ),
    scaffoldBackgroundColor: CustomColors.blackColor,

    /// color of unchecked check box
    unselectedWidgetColor: Colors.black,
    textTheme: TextTheme(
      /// cairo, black , 8 ,w400
      headline1: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: CustomColors.blackColor,
        fontFamily: 'cairo',
      ),

      ///cairo, white ,size 12 , w500
      headline2: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: CustomColors.blackColor,
        fontFamily: 'cairo',
      ),

        ///cairo, primaryColor, 14 , w400
        headline3: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: CustomColors.primaryColor,
          fontFamily: 'cairo',
        ),


        /// cairo, whiteColor, 18 , w600
        headline4: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: CustomColors.whiteColor,
          fontFamily: 'cairo',
        ),
        /// cairo, whiteColor, 18 , w600
        headline5: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: CustomColors.whiteColor,
          fontFamily: 'cairo',
        ),
      //
      //   /// nunito, red, 12 , w500
      //   headline5: TextStyle(
      //     fontSize: 12.sp,
      //     fontWeight: FontWeight.w500,
      //     color: CustomColors.primaryColor,
      //     fontFamily: 'nunito',
      //   ),
      //
      //   ///nunito, black, 12 , w500
      //   headline6: TextStyle(
      //     fontSize: 12.sp,
      //     fontWeight: FontWeight.w500,
      //     color: CustomColors.blackColor,
      //     fontFamily: 'nunito',
      //   ),
      //
      //   ///nunito, grey, 14 , weight 600
      //   bodyText1: TextStyle(
      //     fontSize: 14.sp,
      //     fontWeight: FontWeight.w600,
      //     color: CustomColors.greyColor,
      //     fontFamily: 'nunito',
      //   ),
      //
      //   ///nunito, black,size 20 , weight 700
      //   caption: TextStyle(
      //     fontSize: 20.sp,
      //     fontWeight: FontWeight.w700,
      //     color: CustomColors.blackColor,
      //     fontFamily: 'nunito',
      //   ),
      //
      //   ///nunito,white,size 10 , weight w500
      //   subtitle1: TextStyle(
      //     fontSize: 12.sp,
      //     fontWeight: FontWeight.w500,
      //     color: CustomColors.greyColor,
      //     fontFamily: 'nunito',
      //   ),
      //
      //   ///nunito,grey ,size 10 , w500
      //   subtitle2: TextStyle(
      //     fontSize: 12.sp,
      //     fontWeight: FontWeight.w500,
      //     color: CustomColors.whiteColor,
      //     fontFamily: 'nunito',
      //   ),
      //
      //   ///nunito, green ,size 14 , w500
      //   bodyText2: TextStyle(
      //     fontSize: 14.sp,
      //     fontWeight: FontWeight.w500,
      //     color: CustomColors.blackColor,
      //     fontFamily: 'nunito',
      //   ),
      //
      //   ///nunito, green ,size 24 , w500
      //   overline: TextStyle(
      //     fontSize: 24.sp,
      //     fontWeight: FontWeight.w600,
      //     color: CustomColors.greenColor,
      //     fontFamily: 'nunito',
      //   ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),

        // overlayColor: MaterialStateProperty.all(
        //   Colors.transparent,
        // ),
        foregroundColor: MaterialStateProperty.all(
          CustomColors.primaryColor,
        ),

        backgroundColor: MaterialStateProperty.all(
          CustomColors.primaryColor,
        ),
      ),
    ),
  );
}
