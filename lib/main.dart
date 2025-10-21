import 'package:flutter/material.dart';
import 'core/di/service_locater.dart';
import 'core/routing/app_router.dart';
import 'core/theming/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppRouter>().config(),
      title: 'Lave Scape',
      theme: AppTheme.defaultTheme(),
    );
  }
}