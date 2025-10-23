import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/core/widgets/search_text_field.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Align(
       alignment: AlignmentDirectional.centerEnd,
       child: SearchTextField()
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      actionsPadding: AppInsets.pageHorizontal.copyWith(start: 0),
      actions:[
       Badge(
        largeSize: 14.h,
        smallSize: 14.h,
        backgroundColor: AppColors.white,
         label: const Text(
             '3',
           style: AppTextStyles.font11PrimaryPurpleBold,
         ),
         textColor: AppColors.primaryPurple600,
        offset: const Offset(4, -8),
        child: SvgPicture.asset(
          AppAssets.bellSVG,
          height: 18.h,
          width: 18.w,
        ),
        )
      ]
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight+10.h);
}