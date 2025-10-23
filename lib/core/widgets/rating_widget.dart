import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, this.rating});
  final double? rating;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.w,
      children: [
        SvgPicture.asset(AppAssets.starSvg),
        Text(
            rating?.toStringAsFixed(2) ?? '4.81',
            style: AppTextStyles.regularSM
        )
      ],
    );
  }
}
