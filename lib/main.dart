import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/app/main_app.dart';
import 'package:flutter_technical_task/core/config/app_config.dart';
import 'package:flutter_technical_task/core/di/service_locater.dart';
import 'package:flutter_technical_task/core/localization/easy_localization_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  AppConfig.initSystemSettings();
  runApp(
    const EasyLocalizationConfig(
      child: ScreenUtilInit(
        designSize: Size(393, 852),
        minTextAdapt: true,
        child: MainApp(),
      ),
    ),
  );
}
