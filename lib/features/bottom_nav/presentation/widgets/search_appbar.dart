import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/core/widgets/search_text_field.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/explore_bloc.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        final isSearchActive = state is ExploreSearchActive;
        return AppBar(
            title: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              width: double.infinity,
              padding: AppInsets.pageHorizontal20.copyWith(
                end: isSearchActive ? 20.w : 12.w
              ),
           child: const SearchTextField(),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: isSearchActive ? 32.w : 0,
          leading: AnimatedSwitcher(
            switchInCurve: Curves.fastEaseInToSlowEaseOut,
            switchOutCurve: Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-0.2, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
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
                padding: EdgeInsetsDirectional.only(start: 12.w),
                child: const Icon(Icons.arrow_back_rounded, color: AppColors.white),
              ),
            )
                : const SizedBox.shrink(key: ValueKey('no_icon')),
          ),
            actions: [
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.ease,
                      switchOutCurve: Curves.ease,
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.2, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      ),
                      child: isSearchActive
                          ? const SizedBox.shrink(key: ValueKey('no_badge'))
                          : Badge(
                        key: const ValueKey('badge'),
                        largeSize: 14.h,
                        smallSize: 14.h,
                        backgroundColor: AppColors.white,
                        label: const Text(
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
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: isSearchActive ? 0 : 20.w,
                    ),
                  ],
                ),
              ),
            ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10.h);
}
