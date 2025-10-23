import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/bottom_nav/data/models/bottom_nav_bar_model.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.valueNotifier});
  final ValueNotifier<int> valueNotifier;
  @override
  Widget build(BuildContext context) {
    final item = BottomNavBarModel.items;
    return Container(
      decoration: const BoxDecoration(
       boxShadow: [
         BoxShadow(
             offset: Offset(0, 10),
             blurRadius: 40,
             spreadRadius: 10,
             color: AppColors.shadowBlack
         )
       ],
       border: Border(
           top: BorderSide(color: AppColors.superLightGrey)
       )
      ),
      child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          return BottomNavigationBar(
            backgroundColor: AppColors.white,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            currentIndex: valueNotifier.value,
            selectedLabelStyle: AppTextStyles.font12PrimaryPurple500
                .copyWith(fontSize: 12.sp),
            unselectedLabelStyle: AppTextStyles.font12PrimaryPurple400
                .copyWith(fontSize: 12.sp),
            selectedItemColor: AppColors.primaryPurple600,
            unselectedItemColor: AppColors.placeHolder,
            onTap: (value) => valueNotifier.value = value,
            items: [
              for(int i = 0; i < 5; i++)
                BottomNavigationBarItem(
                  backgroundColor: AppColors.white,
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 6.h),
                      child: SvgPicture.asset(
                          item[i].svgPath,
                          colorFilter: ColorFilter.mode(
                              value == i ?
                              AppColors.primaryPurple600 :
                              AppColors.placeHolder,
                              BlendMode.srcIn
                          )
                      ),
                    ),
                  ),
                  label: item[i].label.tr(),
                )
            ]
          );
        }
      ),
    );
  }
}
