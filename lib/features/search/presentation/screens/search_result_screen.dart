import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/enums/view_type.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/core/widgets/app_text_field.dart';
import 'package:flutter_technical_task/features/bottom_nav/presentation/widgets/search_appbar.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_items_listview.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_technical_task/features/search/presentation/screens/explore_map_view.dart';

@RoutePage(name: 'SearchResultScreenRoute')
class SearchResultScreen extends StatelessWidget implements AutoRouteWrapper {
  const SearchResultScreen({super.key, required this.searchCubit});

  final SearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        isSearchActive: true,
        onTap: () {},
        readOnly: false,
        searchBar: Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const AppTextField(
                readOnly: true,
                prefixIcon: SizedBox.shrink(),
                suffixIcon: Icon(
                  Icons.close_sharp,
                  color: AppColors.placeHolderShadowGray,
                  size: 18,
                ),
                hintText: '',
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                         state.selectedCategory??'',
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
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state.viewType == ViewType.map) {
              return const ExploreMapView();
            }
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ExploreItemsListView(
                onViewTypeTap: () {
                  context.read<SearchCubit>().toggleViewType();
                },
                viewType: state.viewType,
              ),
            );
          }
      ).animate().fadeIn(
          duration: 400.ms,
          curve: Curves.easeOutCubic
      ).slideY(
          begin: 0.04,
          duration: 400.ms,
          curve: Curves.easeOutCubic
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: searchCubit,
      child: this,
    );
  }
}
