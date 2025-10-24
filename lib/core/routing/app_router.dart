import 'package:auto_route/auto_route.dart';
import 'package:flutter_technical_task/features/search/presentation/screens/search_screen.dart';
import 'package:injectable/injectable.dart';
import 'app_router.gr.dart';

@Singleton()
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: SplashRoute.page, initial: true),
    AutoRoute(path: '/BottomNavRoute', page: BottomNavRoute.page),
    AutoRoute(path: '/SearchScreenRoute', page: SearchScreenRoute.page),
  ];
}
