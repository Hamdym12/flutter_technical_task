import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_task/core/localization/localization_manager.dart';

class EasyLocalizationConfig extends StatelessWidget {
  const EasyLocalizationConfig({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocalizationManager.supportedLocales,
      path: LocalizationManager.path,
      fallbackLocale: LocalizationManager.fallbackLocale,
      child: child
    );
  }
}
