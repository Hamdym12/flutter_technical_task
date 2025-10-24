import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/add_guest_form.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/select_city_form.dart';
import 'package:flutter_technical_task/features/search/presentation/widgets/select_date_range_form.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SingleChildScrollView(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: AppInsets.pageHorizontal20,
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
                              'Recent Search',
                              style: AppTextStyles.baseMediumFont16Black500,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.borderLightGrey,
                        thickness: 1,
                        height: 24.h,
                      ),
                    ],
                  );
                },
              ),
            ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: (){},
                  child: Text('data')
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Text('data')
              ),
            ],
          ),
        )
      ],
    );
  }
}
