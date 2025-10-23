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
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_list_item.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/view_switch_button.dart';

class ExploreItemsListView extends StatelessWidget {
  const ExploreItemsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ExploreBloc,ExploreState>(
        builder: (context,state)=> Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BlocBuilder<ExploreBloc,ExploreState>(
              builder: (context,state) {
               if(state is ExploreSearchActive) {
                 return const Text('Search Opened');
               }
               return Padding(
                 padding: AppInsets.pageHorizontal20.copyWith(top: 10.h),
                 child: ListView.separated(
                   itemCount: 3,
                   padding: EdgeInsets.only(bottom: 24.h),
                   itemBuilder: (context,index){
                     return ExploreListItem(index: index);
                   },
                   separatorBuilder: (context,index)=>SizedBox(height: 10.h,),
                 ),
               );
              }
            ),
            BlocBuilder<ExploreBloc,ExploreState>(
             builder: (context,state) {
               if(state is ExploreSearchActive) {
                 return const SizedBox.shrink();
               }
               return Positioned(
                 top: 0,
                 bottom: 20.h,
                 child: const Align(
                   alignment: Alignment.bottomCenter,
                   child: ViewSwitchButton(),
                 ),
               );
             }
             )
          ],
        ),
      ),
    );
  }
}
