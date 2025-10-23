import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_gradinets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppInsets.buttonInnerPadding,
      decoration: BoxDecoration(
        border: const GradientBoxBorder(
          gradient:AppGradients.linearBorder,
          width: 1,
        ),
        color: AppColors.primaryPurple600,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        gradient: AppGradients.linearButton,
      ),
      child: Text(
        title??'Guest Favorite',
        style: AppTextStyles.font10PlaceHolder500.copyWith(
            fontSize: 10.sp,
            color: AppColors.textBlack,
            letterSpacing: 0.5
        ),
      ),
    );
  }
}
