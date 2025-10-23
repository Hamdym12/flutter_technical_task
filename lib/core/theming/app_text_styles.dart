import 'package:flutter/cupertino.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';

abstract class AppTextStyles{

  static const font30White700 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const font15PlaceHolder500 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.placeHolder,
  );

  static const font11PrimaryPurpleBold = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryPurple600,
  );

  static const font12PrimaryPurple500 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryPurple600,
  );

  static const font12PrimaryPurple400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryPurple600,
  );

}