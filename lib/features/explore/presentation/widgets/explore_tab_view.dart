import 'package:flutter/material.dart';
import 'package:flutter_technical_task/features/explore/data/categories_data_model.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_items_listview.dart';

class ExploreTabView extends StatelessWidget {
  const ExploreTabView({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    final item = CategoriesDataModel.items;
    return Expanded(
      child: TabBarView(
       physics: const BouncingScrollPhysics(),
       controller: tabController,
       children: [
         for(int i = 0; i < item.length; i++)
           const ExploreItemsListView()
       ]
      )
    );
  }
}
