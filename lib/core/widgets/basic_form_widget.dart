import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/constants/app_shadows.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class BasicFormWidget extends StatelessWidget {
  const BasicFormWidget({super.key, this.title='', this.suffix, this.onTap});
  final String title;
  final Widget? suffix;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.basicFormInput8),
            border: Border.all(color: AppColors.borderLightGrey,width: 1),
            boxShadow: AppShadows.dropShadowSm
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: AppInsets.basicFormInput14H16W,
              child: Text(
                title,
                style: AppTextStyles.inputDefaultFont15ExtraGray500
                    .copyWith(letterSpacing: 0.5),
              ),
            ),
            suffix ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
