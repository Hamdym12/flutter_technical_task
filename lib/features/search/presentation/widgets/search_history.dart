import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: AppInsets.componentH20V20.copyWith(top: 0),
            child: ListTile(
              minVerticalPadding: 0,
              minTileHeight: 40.h,
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(
                AppAssets.camelRidingPyramid,
                height: 40.h,
                width: 40.w,
              ),
              title: Text(
                LocaleKeys.categories_camel_riding.tr(),
                style: AppTextStyles.font14DeepGray500,
              ),
              subtitle: Text(
                'Jan 4-5',
                style: AppTextStyles.font12SecondaryLightGray400,
              ),
            ),
          ),
      ],
    );
  }
}
