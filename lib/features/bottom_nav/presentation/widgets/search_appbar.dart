import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/routing/app_router.gr.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/core/widgets/search_text_field.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key, this.isSearchActive = false, this.onTap, this.readOnly});
  final bool isSearchActive;
  final Function()? onTap;
  final bool? readOnly;

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10.h);}

class _SearchAppBarState extends State<SearchAppBar> {
  bool isSearchActive = false;
  @override
  void initState() {
    super.initState();
    if (widget.isSearchActive) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => isSearchActive = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: AppColors.primaryPurple600,
      title: AnimatedPadding(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: AppInsets.pageHorizontal20.copyWith(
          end: isSearchActive ? 0.w : 12.w,
          start: 20.w,
        ),
        child: SearchTextField(
          readOnly: widget.readOnly ?? true,
          onTap: widget.onTap ?? ()=> context.pushRoute(const SearchScreenRoute()),
        ),
      ),
      leadingWidth: !isSearchActive ? 0 : 36.w,
      leading: AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          offset: isSearchActive ? const Offset(0.2, 0) : Offset.zero,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            opacity: isSearchActive ? 1 : 0,
            child: isSearchActive
                ? GestureDetector(
              key: const ValueKey('back_icon'),
              onTap: () {
                if (FocusManager.instance.primaryFocus!.hasFocus) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
                context.maybePop();
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 8.w),
                child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: AppColors.white
                ),
              ),
            )
                : const SizedBox.shrink(key: ValueKey('no_icon')),
          )),
      actions: [
        AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          offset: isSearchActive ? const Offset(0.2, 0) : Offset.zero,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            opacity: isSearchActive ? 0 : 1,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.only(right: isSearchActive ? 8.w : 20.w),
              child: Badge(
                largeSize: 14.h,
                smallSize: 14.h,
                backgroundColor: AppColors.white,
                label: Text(
                  '3',
                  style: AppTextStyles.font11PrimaryPurpleBold,
                ),
                textColor: AppColors.primaryPurple600,
                offset: const Offset(4, -8),
                child: SvgPicture.asset(
                  AppAssets.bellSVG,
                  height: 18.h,
                  width: 18.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}
