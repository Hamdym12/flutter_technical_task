import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_technical_task/core/constants/app_gradinets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/constants/app_shadows.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GradientBluredButton extends StatelessWidget {
  const GradientBluredButton({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.xxl16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: AppInsets.buttonInnerPadding,
          decoration: BoxDecoration(
            border: const GradientBoxBorder(
              gradient:AppGradients.linearBorder,
              width: 1,
            ),
            boxShadow: AppShadows.dropShadowSm,
            borderRadius: BorderRadius.circular(AppRadius.xxl16),
            gradient: AppGradients.linearButton,
          ),
          child: Text(
            title??'Guest Favorite',
            style: AppTextStyles.font10PlaceHolder500.copyWith(
                color: AppColors.textBlack,
            ),
          ),
        ),
      ),
    );
  }
}
