// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter_technical_task/features/bottom_nav/presentation/screens/bottom_nav_screen.dart'
    as _i1;
import 'package:flutter_technical_task/features/search/presentation/cubit/search_cubit.dart'
    as _i7;
import 'package:flutter_technical_task/features/search/presentation/screens/search_result_screen.dart'
    as _i2;
import 'package:flutter_technical_task/features/search/presentation/screens/search_screen.dart'
    as _i3;
import 'package:flutter_technical_task/features/splash/presentation/screens/splash_screen.dart'
    as _i4;

/// generated route for
/// [_i1.BottomNavScreen]
class BottomNavRoute extends _i5.PageRouteInfo<void> {
  const BottomNavRoute({List<_i5.PageRouteInfo>? children})
    : super(BottomNavRoute.name, initialChildren: children);

  static const String name = 'BottomNavRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.BottomNavScreen();
    },
  );
}

/// generated route for
/// [_i2.SearchResultScreen]
class SearchResultScreenRoute
    extends _i5.PageRouteInfo<SearchResultScreenRouteArgs> {
  SearchResultScreenRoute({
    _i6.Key? key,
    required _i7.SearchCubit searchCubit,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         SearchResultScreenRoute.name,
         args: SearchResultScreenRouteArgs(key: key, searchCubit: searchCubit),
         initialChildren: children,
       );

  static const String name = 'SearchResultScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchResultScreenRouteArgs>();
      return _i5.WrappedRoute(
        child: _i2.SearchResultScreen(
          key: args.key,
          searchCubit: args.searchCubit,
        ),
      );
    },
  );
}

class SearchResultScreenRouteArgs {
  const SearchResultScreenRouteArgs({this.key, required this.searchCubit});

  final _i6.Key? key;

  final _i7.SearchCubit searchCubit;

  @override
  String toString() {
    return 'SearchResultScreenRouteArgs{key: $key, searchCubit: $searchCubit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchResultScreenRouteArgs) return false;
    return key == other.key && searchCubit == other.searchCubit;
  }

  @override
  int get hashCode => key.hashCode ^ searchCubit.hashCode;
}

/// generated route for
/// [_i3.SearchScreen]
class SearchScreenRoute extends _i5.PageRouteInfo<void> {
  const SearchScreenRoute({List<_i5.PageRouteInfo>? children})
    : super(SearchScreenRoute.name, initialChildren: children);

  static const String name = 'SearchScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SearchScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
