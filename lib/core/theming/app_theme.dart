import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();

  static ThemeData defaultTheme(){
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    );
  }
}