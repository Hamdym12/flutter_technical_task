import 'package:flutter/material.dart';
import 'package:flutter_technical_task/features/bottom_nav/presentation/widgets/search_appbar.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/categories_tab_bar.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/explore_items_list.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchAppBar(),
      body: Column(
        children: [
          CategoriesTabBar(),
          ExploreItemsList()
        ],
      ),
    );
  }
}
