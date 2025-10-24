import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_task/core/di/service_locater.dart';
import 'package:flutter_technical_task/features/bottom_nav/presentation/widgets/search_appbar.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/explore_bloc/explore_bloc.dart';
import 'package:flutter_technical_task/features/explore/presentation/widgets/categories_tab_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExploreBloc>(),
      child: const Scaffold(
        appBar: SearchAppBar(),
        body: CategoriesTabBar(),
      ),
    );
  }
}
