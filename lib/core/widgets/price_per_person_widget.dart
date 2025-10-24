import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/localization/locale_keys.g.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';

class PricePerPersonWidget extends StatelessWidget {
  const PricePerPersonWidget({super.key, this.price});
  final double? price;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 180.w),
                child: Text(
                  "\$${price?.toStringAsFixed(2) ?? '69.99'}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.font18Black700,
                ),
              ),
            ),
            TextSpan(
              text: ' / ${LocaleKeys.per_person.tr()}',
              style: AppTextStyles.font12TextBlack400,
            ),
          ],
        ),
      ),
    );
  }
}
