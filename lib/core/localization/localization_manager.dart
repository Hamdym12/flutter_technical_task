import 'dart:ui';

class LocalizationManager{
  LocalizationManager._();

  static const supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static const path = 'assets/translations';
  static const fallbackLocale = Locale('en');
}