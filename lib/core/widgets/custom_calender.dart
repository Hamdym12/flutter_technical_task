import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/book_reservation_cubit/book_reservation_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        final PickerDateRange range = args.value;
        final DateTime start = range.startDate ?? DateTime.now();
        final DateTime end = range.endDate ?? start;

        // استخدم صيغة مختصرة للشهر (Aug, Sep, etc)
        final String startMonth = DateFormat('MMM').format(start);
        final String endMonth = DateFormat('MMM').format(end);

        if (startMonth == endMonth) {
          // لو الشهرين نفس بعض → Aug 10–12
          _range = '$startMonth ${start.day}–${end.day}';
        } else {
          // لو مختلفين → Aug 30 – Sep 2
          _range = '$startMonth ${start.day} – $endMonth ${end.day}';
        }
      } else if (args.value is DateTime) {
        _selectedDate = DateFormat('MMM d').format(args.value);
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });

    if (_range.isNotEmpty) {
      context.read<BookReservationCubit>().selectDateRange(dateRange: _range);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.listItemInnerPadding.copyWith(top: 0),
      child: SfDateRangePicker(
        onSelectionChanged: _onSelectionChanged,
        todayHighlightColor: AppColors.primaryPurple600,
        selectionMode: DateRangePickerSelectionMode.range,
        backgroundColor: AppColors.white,
         rangeSelectionColor: AppColors.gray50,
        minDate: DateTime.now(),
        headerHeight: 60.h,
        headerStyle: const DateRangePickerHeaderStyle(
          textStyle: AppTextStyles.mediumLgFont18DeepGray500,
          backgroundColor: AppColors.white,
           textAlign: TextAlign.center,
        ),
        initialSelectedRange: PickerDateRange(
          DateTime.now().subtract(const Duration(days: 4)),
          DateTime.now().add(const Duration(days: 3)),
        ),
        rangeTextStyle: AppTextStyles.font14DeepGray500.copyWith(
          fontSize: 14.sp
        ),
        monthCellStyle: DateRangePickerMonthCellStyle(
           textStyle: AppTextStyles.font14DeepGray500.copyWith(
             fontSize: 14.sp
           ),
        ),
      ),
    );
  }
}