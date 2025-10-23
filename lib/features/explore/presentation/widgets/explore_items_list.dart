import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_technical_task/core/constants/app_assets.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/constants/app_radius.dart';
import 'package:flutter_technical_task/core/constants/app_shadows.dart';
import 'package:flutter_technical_task/core/constants/app_strings.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/core/widgets/add_to_wishlist_widget.dart';
import 'package:flutter_technical_task/core/widgets/gradinet_button.dart';
import 'package:flutter_technical_task/core/widgets/price_per_person_widget.dart';
import 'package:flutter_technical_task/core/widgets/rating_widget.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/explore_bloc.dart';

class ExploreItemsList extends StatelessWidget {
  const ExploreItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocBuilder<ExploreBloc,ExploreState>(
            builder: (context,state) {
             if(state is ExploreSearchActive) {
               return const Text('Search Opened');
             }
             return Padding( ///ToDo: Add simulated loading shimmer
               padding: AppInsets.pageHorizontal.copyWith(top: 10.h),
               child: ListView.separated(
                 itemCount: 3,
                 padding: EdgeInsets.only(bottom: 24.h),
                 itemBuilder: (context,index){
                   return Stack(
                     alignment: Alignment.topCenter,
                     children: [
                       Container(
                         height: 452.h,
                         decoration: BoxDecoration(
                             color: AppColors.white,
                             borderRadius: BorderRadius.circular(AppRadius.xl),
                             border: Border.all(
                                 color: AppColors.superLightGrey,
                                 width: 1
                             ),
                             boxShadow: AppShadows.dropShadowSm
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Image.asset(
                               index == 1 ?
                               AppAssets.camelRidingPng :
                               AppAssets.horseRidingPng,
                               height: 334.h,
                               width: double.infinity,
                               fit: BoxFit.fill,
                             ),
                             Padding(
                               padding: AppInsets.listItemInnerPadding,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Wrap(
                                     direction: Axis.vertical,
                                     crossAxisAlignment: WrapCrossAlignment.start,
                                     spacing: 4.h,
                                     children: [
                                       ConstrainedBox(
                                         constraints: BoxConstraints(maxWidth: 321.w),
                                         child: Text(
                                           AppStrings.desertCamelAdventure,
                                           style: AppTextStyles.baseMedium.copyWith(
                                               fontSize: 16.sp
                                           ),
                                           overflow: TextOverflow.ellipsis,
                                           maxLines: 1,
                                         ),
                                       ),
                                       Row(
                                         spacing: 6.w,
                                         children: [
                                           SvgPicture.asset(AppAssets.mapPinSvg),
                                           ConstrainedBox(
                                             constraints: BoxConstraints(maxWidth: 280.w),
                                             child: Text(
                                               AppStrings.adventureLocation,
                                               style: AppTextStyles.regularSM.copyWith(
                                                   fontSize: 14.sp
                                               ),
                                               overflow: TextOverflow.ellipsis,
                                               maxLines: 1,
                                             ),
                                           )
                                         ],
                                       ),
                                     ],
                                   ),
                                   SizedBox(height: 10.h),
                                   const Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.end,
                                     children: [
                                       PricePerPersonWidget(),
                                       RatingWidget()
                                     ],
                                   )
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding: AppInsets.listItemInnerPadding,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             if(index==0) const GradientButton()
                             else const SizedBox(),
                             const AddToWishlistWidget(isLiked: false)
                           ],
                         ),
                       )
                     ],
                   );
                 },
                 separatorBuilder: (context,index)=>SizedBox(height: 10.h,),
               ),
             );
            }
          ),
        ],
      ),
    );
  }
}
