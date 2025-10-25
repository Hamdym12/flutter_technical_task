import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/constants/app_shadows.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ExploreListItemShimmer extends StatelessWidget {
  const ExploreListItemShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    final baseColor = AppColors.placeHolderShadowGray.withOpacity(0.3);
    final highlightColor = AppColors.gray50;
    Widget shimmerBox({
      required double height,
      required double width,
      double radius = 6,
    }) {
      return Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        period: const Duration(milliseconds: 1200),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(radius.r),
          ),
        ),
      );
    }
    return Container(
      height: 452.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl14),
        boxShadow: AppShadows.dropShadowSm,
        border: Border.all(color: AppColors.borderLightGrey, width: 1),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                period: const Duration(milliseconds: 1100),
                child: Container(
                  height: 334.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppRadius.xl14),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppInsets.listItemInnerPadding16H16V,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerBox(height: 20.h, width: 321.w, radius: 6),
                    SizedBox(height: 8.h),
                    Row(
                      spacing: 6.w,
                      children: [
                        shimmerBox(height: 16.h, width: 16.h, radius: 4),
                        shimmerBox(height: 16.h, width: 280.w, radius: 6),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        shimmerBox(height: 22.h, width: 90.w, radius: 6),
                        shimmerBox(height: 22.h, width: 70.w, radius: 6),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: AppInsets.listItemInnerPadding16H16V,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerBox(height: 28.h, width: 100.w, radius: 20),
                shimmerBox(height: 28.h, width: 28.h, radius: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
