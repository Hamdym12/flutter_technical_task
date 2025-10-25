import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/categories_tab_bar.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/add_guest_form.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/select_city_form.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/select_date_range_form.dart';

class SearchInputsForms extends StatelessWidget {
  const SearchInputsForms({super.key, required this.searchCubit});
  final SearchCubit searchCubit;
  @override
  Widget build(BuildContext context) {
    return CategoriesTabBar(
      searchCubit: searchCubit,
      isSearch: true,
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
    );
  }
}
