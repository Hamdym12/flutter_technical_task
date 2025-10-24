import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/enums/view_type.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class ViewSwitchButton extends StatelessWidget {
  const ViewSwitchButton({super.key,  this.viewType = ViewType.map});
  final ViewType viewType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppInsets.buttonInnerPadding,
      decoration: BoxDecoration(
          color: AppColors.primaryPurple600,
          borderRadius: BorderRadius.circular(AppRadius.componentRadius8)
      ),
      child: Row(
        spacing: 5.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.map),
          Text(
              '${viewType == ViewType.map ? 'Map' : 'List'} View',
              style: AppTextStyles.font14White600
          )
        ],
      ),
    );
  }
}
