import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';

abstract class AppTextStyles{

  static final font30White700 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static final font15PlaceHolder500 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.placeHolderShadowGray,
  );

  static final font10PlaceHolder500 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.placeHolderShadowGray,
  );

  static final font11PrimaryPurpleBold = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryPurple600,
  );

  static final font12PrimaryPurple500 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryPurple600,
  );

  static final font12PrimaryPurple400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryPurple600,
  );

  static final baseMediumFont16Black500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack
  );

  static final regularSmFont14Gray = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.gray700
  );

  static final font18Black700 = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textBlack
  );

  static final font12TextBlack400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textBlack,
  );

  static final font14White600 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final font14DeepGray500 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.titleDeepGray,
    fontWeight: FontWeight.w500,
  );

  static final inputDefaultFont15ExtraGray500 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.basicInputExtraGray,
  );

  static final font18DeepGray500 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.titleDeepGray,
  );

  static final font16TitleDeepGray400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.titleDeepGray,
  );
}