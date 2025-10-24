import 'package:animations/animations.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_task/core/di/service_locater.dart';
import 'package:flutter_technical_task/features/bottom_nav/data/models/bottom_nav_bar_model.dart';
import 'package:flutter_technical_task/features/bottom_nav/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter_technical_task/features/bottom_nav/presentation/widgets/search_appbar.dart';
import 'package:flutter_technical_task/features/explore/presentation/bloc/explore_bloc/explore_bloc.dart';
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart';

@RoutePage()
class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final valueNotifier = ValueNotifier<int>(0);
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context,value,child) {
        return MultiBlocProvider(
          providers: [
          BlocProvider(create: (context) => getIt<ExploreBloc>()),
          BlocProvider<SearchCubit>(create: (context) => getIt<SearchCubit>())
          ],
          child: BlocBuilder<ExploreBloc,ExploreState>(
            builder: (context,state) {
              final isSearchActive = state is ExploreSearchActive;
              return Scaffold(
                appBar: const SearchAppBar(),
                body: PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child,Animation<double> animation,
                      Animation<double> secondaryAnimation
                      ){
                    return SharedAxisTransition(
                      fillColor: Colors.transparent,
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                      child: child,
                    );
                  },
                  child: BottomNavBarModel.pages[value],
                ),
                bottomNavigationBar:
                 isSearchActive ?
                 const SizedBox():
                 BottomNavBar(valueNotifier: valueNotifier),
              );
            }
          ),
        );
      },
    );
  }
}
