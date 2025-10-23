import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_technical_task/core/constants/app_insets.dart';
import 'package:flutter_technical_task/core/theming/app_colors.dart';
import 'package:flutter_technical_task/core/theming/app_text_styles.dart';
import 'package:flutter_technical_task/features/explore/data/categories_data_model.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/book_reservation_view.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_items_listview.dart';

class CategoriesTabBar extends StatefulWidget {
  const CategoriesTabBar({super.key});
  @override
  State<CategoriesTabBar> createState() => _CategoriesTabBarState();
}

class _CategoriesTabBarState extends State<CategoriesTabBar> with
 SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final valueNotifier = ValueNotifier<int>(0);
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: CategoriesDataModel.items.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final item = CategoriesDataModel.items;
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
           return TabBar(
             tabAlignment: TabAlignment.start,
             controller: _tabController,
             isScrollable: true,
             dividerColor: AppColors.borderLightGrey,
             dividerHeight: 1.h,
             indicatorPadding: EdgeInsets.zero,
             indicatorColor: AppColors.primaryPurple600,
             indicatorSize: TabBarIndicatorSize.label,
             labelPadding: EdgeInsets.zero,
             indicator: const UnderlineTabIndicator(
                 borderSide: BorderSide(
                   color: AppColors.primaryPurple600,
                   width: 2,
                 ),
                 insets: EdgeInsets.zero
             ),
             unselectedLabelStyle: AppTextStyles.font10PlaceHolder500
                 .copyWith(fontSize: 10.sp),
             labelStyle: AppTextStyles.font12PrimaryPurple500
                 .copyWith(fontSize: 10.sp),
             padding: EdgeInsetsDirectional.only(top: 4.h),
             onTap: (v) {
               valueNotifier.value = v;
             },
             tabs: [
              for(int i = 0; i < item.length; i++)
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.w),
                 child: Tab(
                   icon: Padding(
                     padding: EdgeInsets.only(bottom: 6.h),
                     child: SvgPicture.asset(
                       item[i].svgPath,
                       colorFilter: ColorFilter.mode(
                           value == i ?
                           AppColors.primaryPurple600:
                           AppColors.placeHolder,
                           BlendMode.srcIn
                       )
                     ),
                   ),
                   text: item[i].label.tr(),
                 ),
               )
             ]
            );
          }
        ),
        Expanded(
          child: TabBarView(
             physics: const BouncingScrollPhysics(),
            controller: _tabController,
              children: [
                for(int i = 0; i < item.length; i++)
                  i == 0 ?
                  const ExploreItemsListView():
                  const BookReservationView()
              ]
          ),
        )
      ],
    );
  }
}
