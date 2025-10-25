import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
    child: Text(
      LocaleKeys.app_title.tr(),
      style:AppTextStyles.font30White700.
      copyWith(letterSpacing: 5)
    )
        .animate()
       .fadeIn(duration: 600.ms, curve: Curves.easeInOut)
       .scaleXY(
       begin: 0.5,
       end: 1.2, duration: 900.ms,
       curve: Curves.easeInOut
      )
    );
  }
}
