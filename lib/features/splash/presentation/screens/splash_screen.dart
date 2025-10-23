import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_task/core/routing/app_router.gr.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/features/splash/presentation/widgets/splash_body.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed((const Duration(milliseconds: 1500)),(){
      if(mounted) context.replaceRoute(const BottomNavRoute());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryPurple600,
      body: SplashBody(),
    );
  }
}
