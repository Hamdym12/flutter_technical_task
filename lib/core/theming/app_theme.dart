import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    splashFactory: Platform.isIOS
        ? NoSplash.splashFactory
        : InkRipple.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryPurple600,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryPurple600,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    brightness: Brightness.light,
    primaryColor: AppColors.primaryPurple600,
    scaffoldBackgroundColor: AppColors.backgroundOffWhite,
    textTheme: GoogleFonts.interTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryPurple600,
      primary: AppColors.primaryPurple600,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(243.w, 38.h)),
        backgroundColor: const WidgetStatePropertyAll(
          AppColors.primaryPurple600,
        ),
        side: const WidgetStatePropertyAll(BorderSide.none),
        enableFeedback: false,
        elevation: const WidgetStatePropertyAll(0),
        padding: WidgetStatePropertyAll(AppInsets.buttonH12V10),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        textStyle: WidgetStatePropertyAll(AppTextStyles.font15White600),
        foregroundColor: const WidgetStatePropertyAll(AppColors.white),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(80.w, 38.h)),
        backgroundColor: const WidgetStatePropertyAll(AppColors.white),
        side: WidgetStatePropertyAll(
          BorderSide(color: AppColors.borderLightGrey, width: 1.w),
        ),
        enableFeedback: false,
        elevation: const WidgetStatePropertyAll(0),
        visualDensity: VisualDensity.standard,
        shadowColor: const WidgetStatePropertyAll(AppColors.shadowLightBlack),
        padding: WidgetStatePropertyAll(AppInsets.buttonH12V10),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        foregroundColor: const WidgetStatePropertyAll(AppColors.titleDeepGray),
        textStyle: WidgetStatePropertyAll(
          AppTextStyles.font15White600.copyWith(color: AppColors.titleDeepGray),
        ),
      ),
    ),
  );
}
