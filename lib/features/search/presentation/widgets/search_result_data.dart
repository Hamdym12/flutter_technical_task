import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';

class SearchResultData extends StatelessWidget {
  const SearchResultData({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.selectedCategory??LocaleKeys.categories_flexible.tr(),
                style: AppTextStyles.font12DeepGray600,
              ),
              LayoutBuilder(
                  builder: (context,constraints) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10.w,
                        children: [
                          Text(
                            state.selectedCity??'',
                            style: AppTextStyles.font12PrimaryPurple500.copyWith(
                                color: AppColors.placeHolderShadowGray
                            ),
                          ),
                          Container(
                            height: 6.h,
                            width: 6.h,
                            decoration: const ShapeDecoration(
                                color: AppColors.extraLightGrey,
                                shape: CircleBorder()),
                          ),
                          Text(
                            state.selectedDateRange??'',
                            style: AppTextStyles.font12PrimaryPurple500.copyWith(
                                color: AppColors.placeHolderShadowGray
                            ),
                          ),
                          if(state.guestAdultCounter != 0 || state.guestChildCounter != 0)
                            ...[
                              Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: const ShapeDecoration(
                                    color: AppColors.extraLightGrey,
                                    shape: CircleBorder()),
                              ),

                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: constraints.maxWidth*0.2),
                                child: Text(
                                  state.formattedGuestTitle,
                                  style: AppTextStyles.font12PrimaryPurple500.copyWith(
                                      color: AppColors.placeHolderShadowGray
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ]
                        ],
                      ),
                    );
                  }
              )
            ],
          ),
        );
      },
    );
  }
}
