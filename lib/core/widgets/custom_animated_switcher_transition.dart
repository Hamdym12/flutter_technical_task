import 'package:flutter/material.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/constants/app_shadows.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';

class CustomAnimatedSwitcherTransition extends StatelessWidget {
  const CustomAnimatedSwitcherTransition({super.key, required this.isOpen, required this.valueKey, required this.child, this.childPadding, this.height});
  final bool isOpen;
  final String valueKey;
  final Widget child;
  final EdgeInsetsDirectional? childPadding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.overLayDropDown12),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeOutCubic,
        transitionBuilder: (child, animation) {
          return SizeTransition(
            sizeFactor: animation,
            axisAlignment: -1.0,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: isOpen
            ? Container(
          key: ValueKey(valueKey),
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.overLayDropDown12),
            boxShadow: AppShadows.dropShadowX,
          ),
          child: Material(
            color: AppColors.white,
            child: Container(
              padding: childPadding ?? AppInsets.componentH20V20,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderLightGrey),
                borderRadius: BorderRadius.circular(AppRadius.overLayDropDown12),
              ),
              child: child,
            ),
          ),
        )
            : SizedBox.shrink(key: ValueKey(valueKey)),
      ),
    );
  }
}
