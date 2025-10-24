import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/explore_bloc/explore_bloc.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_list_item.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/view_switch_button.dart';

class ExploreItemsListView extends StatelessWidget {
  const ExploreItemsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.pageHorizontal20
          .copyWith(top: 10.h),
      child: BlocBuilder<ExploreBloc,ExploreState>(
        builder: (context,state)=> Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.separated(
              itemCount: 3,
              padding: EdgeInsets.only(bottom: 24.h),
              itemBuilder: (context,index)=> ExploreListItem(index: index),
              separatorBuilder: (context,index)=>SizedBox(height: 10.h,),
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
