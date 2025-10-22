import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback? onFilterTap;
  final ValueChanged<String>? onChanged;

  const SearchTextField({
    super.key,
    this.controller,
    this.hintText,
    this.onFilterTap,
    this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      width: 342.w,
      child: TextFormField(
        cursorColor: AppColors.placeHolder,
        cursorHeight: 18.sp,
        cursorRadius: const Radius.circular(0),
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.title,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText??LocaleKeys.search_hint.tr(),
          hintStyle: AppTextStyles.font15PlaceHolder500,
          prefixIconConstraints: BoxConstraints(maxWidth: 30.w),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.all(12).copyWith(
              end: 6,
            ),
            child: SvgPicture.asset(
              AppAssets.searchSVG
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: onFilterTap,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color:  AppColors.grey50,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(8),
                  bottomEnd: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: SvgPicture.asset(AppAssets.equalizerSVG),
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
