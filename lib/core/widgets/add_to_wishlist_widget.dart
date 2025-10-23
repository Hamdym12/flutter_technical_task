import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';

class AddToWishlistWidget extends StatelessWidget {
  const AddToWishlistWidget({super.key, this.isLiked=false});
  final bool isLiked;
  @override
  Widget build(BuildContext context) {
    final valueNotifier = ValueNotifier<bool>(isLiked);
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context,value,child) {
        return GestureDetector(
          onTap: () {
            valueNotifier.value = !valueNotifier.value;
            if(value) HapticFeedback.mediumImpact();
          },
         child: Stack(
           alignment: Alignment.center,
           children: [
             Icon(
               Icons.favorite,
               color: value ? Colors.red: const Color(0x4D222222),
               size: 25,
             ),
             Icon(
               CupertinoIcons.heart,
               color: value ? Colors.red : AppColors.white,
               size: 25,
             ),
           ],
         )

        );
      }
    );
  }
}
