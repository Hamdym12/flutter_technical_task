import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/explore_bloc.dart';

class SearchTextField extends StatefulWidget {
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
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      final bloc = context.read<ExploreBloc>();
      if (_focusNode.hasFocus) {
        bloc.add(ExploreSearchOpened());
      } else {
        bloc.add(ExploreSearchClosed());
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.placeHolder,
      focusNode: _focusNode,
      cursorHeight: 18.sp,
      cursorRadius: const Radius.circular(0),
      controller: widget.controller,
      onChanged: widget.onChanged,
      style: AppTextStyles.font14DeepGray500.copyWith(
        fontSize: 14.sp,
      ),
      decoration: InputDecoration(
        filled: true,
        constraints: BoxConstraints(maxHeight: 38.h),
        fillColor: Colors.white,
        hintText: widget.hintText??LocaleKeys.search_hint.tr(),
        hintStyle: AppTextStyles.font15PlaceHolder500,
        prefixIconConstraints: BoxConstraints(maxWidth: 30.w),
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w).copyWith(
            end: 6.w
          ),
          child: SvgPicture.asset(
            AppAssets.searchSVG
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: widget.onFilterTap,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color:  AppColors.grey50,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(AppRadius.basicFormInput8),
                bottomEnd: Radius.circular(AppRadius.basicFormInput8),
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
          borderRadius: BorderRadius.circular(AppRadius.basicFormInput8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
