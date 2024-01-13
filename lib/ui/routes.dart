import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mena_conf/core/services/navigation_service.dart';
import 'package:mena_conf/locator.dart';
import 'package:mena_conf/ui/pages/home/home_view.dart';


class RouteData {
  final String name;
  final String path;

  const RouteData({required this.name, required this.path});
}

class RouterVariables {
  static const mainApp = RouteData(name: 'main', path: '/');
  static const home = RouteData(name: 'home', path: 'home');
}


/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: RouterVariables.mainApp.path,
  navigatorKey: locator<NavigationService>().navigationKey,
  routes: <RouteBase>[
    GoRoute(
      path: RouterVariables.home.path,
      name: RouterVariables.home.name,
      parentNavigatorKey: locator<NavigationService>().navigationKey,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
  ],
);

/// Returns a material page with a [child] and key == [state.pageKey]
Page getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}