import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppInsets {
  static EdgeInsetsDirectional pageHorizontal = EdgeInsetsDirectional.symmetric(
    horizontal: 20.w,
  );
  static EdgeInsetsDirectional listItemInnerPadding =
      EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 16.h);

  static EdgeInsetsDirectional buttonInnerPadding =
      EdgeInsetsDirectional.symmetric(horizontal: 8.5.w, vertical: 4.h);
}
