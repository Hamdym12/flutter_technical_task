import 'package:flutter/services.dart';

abstract class AppConfig {
  static Future<void> initSystemSettings() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  }
}
