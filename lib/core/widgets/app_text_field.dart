import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback? onFilterTap;
  final ValueChanged<String>? onChanged;
  final bool? readOnly;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.onFilterTap,
    this.onChanged,
    this.readOnly,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.placeHolderShadowGray,
      cursorHeight: 18.sp,
      readOnly: readOnly??false,
      onTap: onTap,
      cursorRadius: const Radius.circular(0),
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyles.font14DeepGray500,
      decoration: InputDecoration(
        filled: true,
        constraints: BoxConstraints(maxHeight: 38.h),
        fillColor: Colors.white,
        hintText: hintText??LocaleKeys.search_hint.tr(),
        hintStyle: AppTextStyles.font15PlaceHolder500,
        prefixIconConstraints: BoxConstraints(maxWidth: 30.w),
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w).copyWith(
            end: 6.w
          ),
          child: prefixIcon??SvgPicture.asset(
            AppAssets.searchSVG
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: onFilterTap,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color:  AppColors.gray50,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(AppRadius.basicFormInput8),
                bottomEnd: Radius.circular(AppRadius.basicFormInput8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(12),
              child: suffixIcon??SvgPicture.asset(AppAssets.equalizerSVG),
            ),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.basicFormInput8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
