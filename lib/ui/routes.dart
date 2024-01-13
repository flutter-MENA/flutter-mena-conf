import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mena_conf/ui/pages/home/home_view.dart';
import 'package:mena_conf/ui/pages/main_app/main_app_view.dart';


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
  routes: <RouteBase>[
    GoRoute(
      path: RouterVariables.mainApp.path,
      name: RouterVariables.mainApp.name,
      builder: (BuildContext context, GoRouterState state) {
        return const MainAppView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouterVariables.home.path,
          name: RouterVariables.home.name,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        ),
      ],
    ),
  ],
);