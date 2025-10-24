import 'package:flutter/cupertino.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';

abstract class AppShadows{
  static const dropShadowSm = [
    BoxShadow(
      blurStyle: BlurStyle.inner,
      color: AppColors.shadowLightBlack,
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0
    )
  ];

  static const boxShadowMd = [
    BoxShadow(
     offset: Offset(0, 10),
     blurRadius: 40,
     spreadRadius: 10,
     color: AppColors.shadowBlack
    )
  ];

  static const dropShadowX = [
    BoxShadow(
        offset: Offset(0, 10),
        blurRadius: 8,
        spreadRadius: 0,
        color: AppColors.shadowLiteGray
    )
  ];
}