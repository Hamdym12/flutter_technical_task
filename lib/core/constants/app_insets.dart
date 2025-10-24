import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppInsets {
  static EdgeInsetsDirectional pageHorizontal20 = EdgeInsetsDirectional.symmetric(
    horizontal: 20.w,
  );
  static EdgeInsetsDirectional listItemInnerPadding16H16V =
      EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 16.h);

  static EdgeInsetsDirectional buttonInnerPadding =
      EdgeInsetsDirectional.symmetric(horizontal: 8.5.w, vertical: 4.h);


  static EdgeInsetsDirectional componentInnerPadding =
  EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 6.h);

  static EdgeInsetsDirectional basicFormInput14H16W =
      EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 14.h);

  static EdgeInsetsDirectional basicFormInput12H =
      EdgeInsetsDirectional.symmetric(horizontal: 12.w);

  static EdgeInsetsDirectional componentH20V20 = EdgeInsetsDirectional.symmetric(
    horizontal: 20.w,
    vertical: 20.h,
  );

  static EdgeInsetsDirectional componentH16 = EdgeInsetsDirectional.symmetric(
    horizontal: 16.w,
  );

}
