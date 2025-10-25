import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/enums/view_type.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_list_item.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_list_item_shimmer.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/view_switch_button.dart';

class ExploreItemsListView extends StatefulWidget {
  const ExploreItemsListView({super.key, this.onViewTypeTap, this.viewType=ViewType.list, this.hasShimmer=false});
  final Function()? onViewTypeTap;
  final ViewType viewType;
  final bool hasShimmer;
  @override
  State<ExploreItemsListView> createState() => _ExploreItemsListViewState();
}

class _ExploreItemsListViewState extends State<ExploreItemsListView> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if(widget.hasShimmer){ /// just for demo
      _isLoading = true;
      Timer(const Duration(milliseconds: 1200), () {
        if (mounted) setState(() => _isLoading = false);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.pageHorizontal20
          .copyWith(top: 10.h),
      child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.separated(
              itemCount: 3,
              padding: EdgeInsets.only(bottom: 24.h),
              itemBuilder: (context,index) {
                return _isLoading ?
                const ExploreListItemShimmer():ExploreListItem(index: index);
              },
              separatorBuilder: (context,index)=>SizedBox(height: 10.h,),
            ),
           Positioned(
            top: 0,
            bottom: 20.h,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ViewSwitchButton(
                onTap: widget.onViewTypeTap,
                viewType: widget.viewType,
              ),
            ),
             )
          ],
        ),
    );
  }
}
