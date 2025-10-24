import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/constants/app_shadows.dart';
import 'package:flutter_technical_task/core/constants/app_strings.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/core/widgets/add_to_wishlist_widget.dart';
import 'package:flutter_technical_task/core/widgets/gradinet_button.dart';
import 'package:flutter_technical_task/core/widgets/price_per_person_widget.dart';
import 'package:flutter_technical_task/core/widgets/rating_widget.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/item_image_pageview.dart';

class ExploreListItem extends StatelessWidget {
  const ExploreListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 452.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.xl14),
              border: Border.all(
                  color: AppColors.borderLightGrey,
                  width: 1
              ),
              boxShadow: AppShadows.dropShadowSm
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemImagePageview(listIndex: index),
              Padding(
                padding: AppInsets.listItemInnerPadding16H16V,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 4.h,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 321.w),
                          child: Text(
                            AppStrings.desertCamelAdventure,
                            style: AppTextStyles.baseMediumFont16Black500,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Row(
                          spacing: 6.w,
                          children: [
                            SvgPicture.asset(AppAssets.mapPinSvg),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 280.w),
                              child: Text(
                                AppStrings.adventureLocation,
                                style: AppTextStyles.regularSmFont14Gray,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PricePerPersonWidget(),
                        RatingWidget()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: AppInsets.listItemInnerPadding16H16V,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(index==0) const GradientButton()
              else const SizedBox(),
              const AddToWishlistWidget(isLiked: false)
            ],
          ),
        )
      ],
    );
  }
}