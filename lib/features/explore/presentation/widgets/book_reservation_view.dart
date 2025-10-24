import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/constants/app_shadows.dart';
import 'package:flutter_technical_task/core/di/service_locater.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/core/widgets/basic_form_widget.dart';
import 'package:flutter_technical_task/core/widgets/city_picker.dart';
import 'package:flutter_technical_task/core/widgets/calender_date_range_picker.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/book_reservation_cubit/book_reservation_cubit.dart';

class BookReservationView extends StatelessWidget {
  const BookReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: BlocProvider<BookReservationCubit>(
        create: (context) => getIt<BookReservationCubit>(),
        child: SingleChildScrollView(
          child: BlocBuilder<BookReservationCubit, BookReservationState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: AppInsets.pageHorizontal20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12.h,
                      children: [
                       BasicFormWidget(
                         title: state.selectedCity ?? LocaleKeys.city.tr(),
                         onTap: () async => await CityPicker.show(context),
                        ),
                        Column(
                          spacing: state.isDatePickerOpen ? 4.h : 0,
                          children: [
                            BasicFormWidget(
                              title: state.selectedDateRange ?? LocaleKeys.selected_date.tr(),
                              onTap: () => context.read<BookReservationCubit>().toggleDataPicker(),
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppRadius.overLayDropDown12),
                              child: AnimatedCrossFade(
                                firstChild: const SizedBox.shrink(),
                                firstCurve: Curves.easeIn,
                                secondCurve: Curves.easeOut,
                                sizeCurve: Curves.fastOutSlowIn,
                                alignment: Alignment.topCenter,
                                secondChild: Container(
                                  height: 400.h,
                                  width: 353.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(AppRadius.overLayDropDown12),
                                    boxShadow: AppShadows.dropShadowX,
                                    border: Border.all(color: AppColors.borderLightGrey),
                                  ),
                                  child: const CalenderDateRangePicker(),
                                ),
                                crossFadeState: state.isDatePickerOpen
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 400),
                              ),
                            ),
                          ],
                        ),
                        BasicFormWidget(title: LocaleKeys.guest.tr()),
                        SizedBox(height: 9.h),
                        Text(
                          'Recent Search',
                          style: AppTextStyles.baseMediumFont16Black500
                              .copyWith(fontSize: 16.sp),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.borderLightGrey,
                    thickness: 1,
                    height: 24.h,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
