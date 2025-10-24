// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter_technical_task/features/bottom_nav/presentation/screens/bottom_nav_screen.dart'
    as _i1;
import 'package:flutter_technical_task/features/search/presentation/screens/search_screen.dart'
    as _i2;
import 'package:flutter_technical_task/features/splash/presentation/screens/splash_screen.dart'
    as _i3;

/// generated route for
/// [_i1.BottomNavScreen]
class BottomNavRoute extends _i4.PageRouteInfo<void> {
  const BottomNavRoute({List<_i4.PageRouteInfo>? children})
    : super(BottomNavRoute.name, initialChildren: children);

  static const String name = 'BottomNavRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.BottomNavScreen();
    },
  );
}

/// generated route for
/// [_i2.SearchScreen]
class SearchScreenRoute extends _i4.PageRouteInfo<void> {
  const SearchScreenRoute({List<_i4.PageRouteInfo>? children})
    : super(SearchScreenRoute.name, initialChildren: children);

  static const String name = 'SearchScreenRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.SearchScreen();
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}
