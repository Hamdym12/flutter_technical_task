import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/core/widgets/search_text_field.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/explore_bloc/explore_bloc.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10.h);
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool isSearchActive = false;

  @override
  void initState() {
    super.initState();
    context.read<ExploreBloc>().stream.listen((state) {
      final active = state is ExploreSearchActive;
      if (mounted && active != isSearchActive) {
        setState(() => isSearchActive = active);
      }
    });
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
        child: const SearchTextField(),
      ),
      leadingWidth: !isSearchActive ? 0 : 44.w,
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
            context.read<ExploreBloc>().add(ExploreSearchClosed());
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 0.w),
            child: const Icon(
                Icons.arrow_back_rounded,
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
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
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
