import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  AppTheme._();

  static ThemeData get light => ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryPurple600,
       surfaceTintColor: Colors.transparent,
        elevation: 0,
       systemOverlayStyle: SystemUiOverlayStyle(
         statusBarColor: AppColors.primaryPurple600,
         statusBarIconBrightness: Brightness.light,
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
  );
}