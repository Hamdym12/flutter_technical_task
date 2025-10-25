import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/app/main_app.dart';
import 'package:flutter_technical_task/core/config/app_config.dart';
import 'package:flutter_technical_task/core/di/service_locater.dart';
import 'package:flutter_technical_task/core/localization/easy_localization_config.dart';
import 'package:flutter_technical_task/core/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  await EasyLocalization.ensureInitialized();
  await AppConfig.initSystemSettings();
  if(kDebugMode) Bloc.observer = AppBlocObserver();
  runApp(
    const EasyLocalizationConfig(
      child: MainApp(),
    ),
  );
}
