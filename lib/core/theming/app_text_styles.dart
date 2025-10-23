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
    fontWeight: FontWeight.w500,
    color: AppColors.placeHolder,
  );

  static const font10PlaceHolder500 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
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

  static const baseMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack
  );

  static const regularSM = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.gray700
  );

  static const boldLG = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.textBlack
  );

  static const font12TextBlack400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textBlack,
  );

  static const font14White600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}