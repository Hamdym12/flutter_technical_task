import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_technical_task/core/constants/app_gradinets.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Animate(
            effects: [
              ShimmerEffect(duration: 3.seconds),
            ],
            child: Container(
              decoration: const BoxDecoration(
                gradient: AppGradients.splashLinearGradient,
              ),
            ),
          ),
          Center(
            child: Animate(
              effects: [
                FadeEffect(duration: 600.ms, curve: Curves.easeInOut),
                ScaleEffect(begin: const Offset(0.4, 0.4), end: const Offset(1.1, 1.1), duration: 900.ms, curve: Curves.easeOutBack),
                BlurEffect(begin: const Offset(3, 3), end: Offset.zero, duration: 900.ms),
              ],
              child: Text(
                LocaleKeys.app_title.tr(),
                style: AppTextStyles.font30White700.copyWith(
                  letterSpacing: 6,
                  shadows: [
                    Shadow(
                      color: Colors.white.withOpacity(0.6),
                      blurRadius: 25,
                    ),
                  ],
                ),
              ),
            )
                .animate(onComplete: (c) => c.loop)
                .scale(
              begin: const Offset(1, 1),
              end: const Offset(1.05, 1.05),
              duration: 1200.ms,
              curve: Curves.easeInOut,
            ).then()
                .scale(
              begin: const Offset(1.05, 1.05),
              end: const Offset(1, 1),
              duration: 1200.ms,
              curve: Curves.easeInOut,
            ),
          ),
        ],
      ),
    );
  }
}
