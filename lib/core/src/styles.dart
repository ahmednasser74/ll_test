import 'package:flutter/material.dart';

import 'colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStyle {
  static final InputDecoration searchInputDecoration = InputDecoration(
    fillColor: Colors.grey[100],
    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
    hintText: 'Search...',
    filled: true,
    labelStyle: TextStyle(color: Colors.transparent),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
  );
  static final BoxDecoration containerShadowDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6,
        offset: Offset(0, 4),
      ),
    ],
  );
}
