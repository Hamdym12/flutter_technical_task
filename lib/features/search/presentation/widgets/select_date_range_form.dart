import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/widgets/basic_form_widget.dart';
import 'package:flutter_technical_task/core/widgets/calender_date_range_picker.dart';
import 'package:flutter_technical_task/core/widgets/custom_animated_switcher_transition.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';

class SelectDateRangeForm extends StatelessWidget {
  const SelectDateRangeForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Column(
          children: [
            BasicFormWidget(
              title: state.selectedDateRange ?? LocaleKeys.selected_date.tr(),
              onTap: () => context.read<SearchCubit>().toggleDataPicker(),
              suffix: Container(
                width: 48.w,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.gray50,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(AppRadius.basicFormInput8),
                    bottomEnd: Radius.circular(AppRadius.basicFormInput8),
                  ),
                ),
                child: SvgPicture.asset(
                  AppAssets.calendarSvg,
                  height: 16.h,
                  width: 16.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:4.h),
              child: CustomAnimatedSwitcherTransition(
                isOpen: state.isDatePickerOpen,
                valueKey: 'date_range_picker',
                childPadding: AppInsets.componentH16,
                height: 353.h,
                child: const CalenderDateRangePicker(),
              ),
            )
          ],
        );
      },
    );
  }
}
