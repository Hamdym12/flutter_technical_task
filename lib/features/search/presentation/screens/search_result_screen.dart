import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_task/core/enums/view_type.dart';
import 'package:flutter_technical_task/features/bottom_nav/presentation/widgets/search_appbar.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_items_listview.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter_technical_task/features/search/presentation/screens/explore_map_view.dart';

@RoutePage(name:'SearchResultScreenRoute')
class SearchResultScreen extends StatelessWidget implements AutoRouteWrapper{
  const SearchResultScreen({super.key, required this.searchCubit});
  final SearchCubit searchCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        isSearchActive: true,
        onTap: (){},
        readOnly: false
      ),
      body: BlocBuilder<SearchCubit,SearchState>(
        builder: (context,state) {
          if(state.viewType == ViewType.map){
            return const ExploreMapView();
          }
          return Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: ExploreItemsListView(
              onViewTypeTap: (){
                context.read<SearchCubit>().toggleViewType();
              },
              viewType: state.viewType,
            ),
          );
        }
      ).animate().fadeIn(
        duration: 400.ms,
        curve: Curves.easeOutCubic
      ).slideY(
        begin: 0.04,
        duration: 400.ms,
        curve: Curves.easeOutCubic
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: searchCubit,
      child: this,
    );
  }
}
