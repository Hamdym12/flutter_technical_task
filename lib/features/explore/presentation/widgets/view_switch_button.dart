import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/enums/view_type.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class ViewSwitchButton extends StatelessWidget {
  const ViewSwitchButton({super.key,  this.viewType = ViewType.map, this.onTap});
  final ViewType viewType;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppInsets.buttonInnerPadding,
        decoration: BoxDecoration(
            color: AppColors.primaryPurple600,
            borderRadius: BorderRadius.circular(AppRadius.componentRadius8)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 5.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(viewType == ViewType.list ?AppAssets.map : AppAssets.list),
            Text(
                '${viewType == ViewType.list ? 'Map' : 'List'} View',
                style: AppTextStyles.font14White600
            )
          ],
        ),
      ),
    ).animate().slideY(
        begin: 0.1,
        duration: 400.ms,
        curve: Curves.easeOutCubic
    );
  }
}
