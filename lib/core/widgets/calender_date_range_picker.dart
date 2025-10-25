import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalenderDateRangePicker extends StatefulWidget {
  const CalenderDateRangePicker({super.key});

  @override
  State<CalenderDateRangePicker> createState() => _CalenderDateRangePickerState();
}

class _CalenderDateRangePickerState extends State<CalenderDateRangePicker> {
  String _range = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        final PickerDateRange range = args.value;
        final DateTime start = range.startDate ?? DateTime.now();
        final DateTime end = range.endDate ?? start;

        final String startMonth = DateFormat('MMM').format(start);
        final String endMonth = DateFormat('MMM').format(end);

        if (startMonth == endMonth) {
          _range = '$startMonth ${start.day}–${end.day}';
        } else {
          _range = '$startMonth ${start.day} – $endMonth ${end.day}';
        }
      }
    });

    if (_range.isNotEmpty) {
      context.read<SearchCubit>().selectDateRange(dateRange: _range);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      selectionRadius: 20.h,
      todayHighlightColor: AppColors.primaryPurple600,
      selectionMode: DateRangePickerSelectionMode.range,
      backgroundColor: AppColors.white,
       rangeSelectionColor: AppColors.gray50,
      selectionTextStyle: AppTextStyles.font14White600.copyWith(
       fontWeight: FontWeight.w500
      ),
      minDate: DateTime.now(),
      headerHeight: 60.h,
      headerStyle: DateRangePickerHeaderStyle(
        textStyle: AppTextStyles.font18DeepGray500,
        backgroundColor: AppColors.white,
         textAlign: TextAlign.center,
      ),
      // initialSelectedRange: PickerDateRange(
      //   DateTime.now(),
      //   DateTime.now().add(const Duration(days: 5)),
      // ),
      rangeTextStyle: AppTextStyles.font14DeepGray500,
      monthCellStyle: DateRangePickerMonthCellStyle(
         textStyle: AppTextStyles.font14DeepGray500,
        disabledDatesTextStyle: AppTextStyles.font14DeepGray500.copyWith(
            color: AppColors.disabledDateLightGray
        ),
      ),
    );
  }
}