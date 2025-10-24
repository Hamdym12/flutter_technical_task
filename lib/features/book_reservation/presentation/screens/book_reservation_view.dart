import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/di/service_locater.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/book_reservation/presentation/cubit/book_reservation_cubit.dart';
import 'package:flutter_technical_task/features/book_reservation/presentation/widgets/add_guest_form.dart';
import 'package:flutter_technical_task/features/book_reservation/presentation/widgets/select_city_form.dart';
import 'package:flutter_technical_task/features/book_reservation/presentation/widgets/select_date_range_form.dart';

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
