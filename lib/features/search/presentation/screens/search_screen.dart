import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/helpers/toast_helper.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/bottom_nav/presentation/widgets/search_appbar.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/categories_tab_bar.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/add_guest_form.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/select_city_form.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/select_date_range_form.dart';

@RoutePage(name:'SearchScreenRoute')
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SearchAppBar(
       isSearchActive: true,
       onTap: (){},
       readOnly: false
      ),
      body: BlocProvider(
        create: (context)=>SearchCubit(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                    CategoriesTabBar(
                     child: Padding(
                       padding: AppInsets.pageHorizontal20.copyWith(top: 20.h),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const SelectCityForm(),
                           SizedBox(height: 12.h),
                           const SelectDateRangeForm(),
                           SizedBox(height: 8.h),
                           const AddGuestForm(),
                           SizedBox(height: 26.h),
                           Text(
                             LocaleKeys.recent_search.tr(),
                             style: AppTextStyles.baseMediumFont16Black500,
                           )
                         ],
                       ),
                     )
                   ),
                    Divider(
                      color: AppColors.borderLightGrey,
                      thickness: 1,
                      height: 24.h,
                    ),
                    SizedBox(height: 4.h),
                    for(int i = 0; i < 3; i++)
                      Padding(
                        padding: AppInsets.componentH20V20.copyWith(top: 0),
                        child: ListTile(
                          minVerticalPadding: 0,
                          minTileHeight: 40.h,
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                              AppAssets.camelRidingPyramid,
                            height: 40.h,
                            width: 40.w,
                          ),
                          title: Text(
                              LocaleKeys.categories_camel_riding.tr(),
                              style: AppTextStyles.font14DeepGray500),
                          subtitle: Text(
                              'Jan 4-5',
                              style: AppTextStyles.font12SecondaryLightGray400
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),
            Container(
              height: 90.h,
              width: double.infinity,
              padding: AppInsets.componentH20V20,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                      top: BorderSide(
                          color: AppColors.borderLightGrey,width: 1
               ))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlinedButton(
                      onPressed: ()=>context.maybePop(),
                      child: Text(LocaleKeys.cancel.tr())
                  ),
                  BlocBuilder<SearchCubit,SearchState>(
                   builder: (context,state) {
                     return ElevatedButton(
                       onPressed: (){
                         if(state.selectedCity != null && state.selectedDateRange != null){
                           showToast(message: 'Ok you can search now');
                         }else{
                           showToast(message: 'Please Complete The Required Fields');
                         }
                       },
                       child: Text(LocaleKeys.search_hint.tr())
                     );
                    }
                  ),
                ],
              ),
            )
          ],
        ).animate()
            .fadeIn(
          duration: 400.ms,
          curve: Curves.easeOutCubic
        ).slideY(
          begin: 0.05,
          duration: 400.ms,
          curve: Curves.easeOutCubic
        ),
      ),
    );
  }
}
