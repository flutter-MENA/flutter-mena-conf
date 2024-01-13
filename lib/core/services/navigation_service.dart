import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {


  /// Global key for accessing the main Navigator state.
  ///
  /// Allows programmatic navigation and control of the primary Navigator.
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  /// Retrieves the primary [NavigatorState] for navigation operations.
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;


  /// Pops the current route off the navigator, and optionally passes arguments to the previous route.
  Future<void> pop({dynamic args}) async {
    /// Uses the `_navigationKey` to access the current navigation context and pops the current route.
    _navigationKey.currentContext!.pop(args);
  }

  /// Navigates to a named route, optionally passing path parameters, query parameters, and extra data.
  Future<void> pushNamed(String name,
      {Map<String, String> pathParams = const {},
        Map<String, dynamic> queryParams = const {},
        Object? extra}) async {
    /// Uses the `_navigationKey` to access the current navigation context and navigates to the named route.
    _navigationKey.currentContext!.goNamed(name,
        pathParameters: pathParams, queryParameters: queryParams, extra: extra);
  }

  /// Replaces the current route with a new route, optionally passing extra data.
  Future<void> pushReplacement(String location, {Object? extra}) async {
    /// Uses the `_navigationKey` to access the current navigation context and replaces the current route.
    _navigationKey.currentContext!.pushReplacement(location, extra: extra);
  }

}