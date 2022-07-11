// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:doit/src/infrastructure/navigation/session_guard.dart' as _i6;
import 'package:doit/src/presentation/add_todo/add_todo_screen.dart' as _i3;
import 'package:doit/src/presentation/dashboard/dashboard_screen.dart' as _i2;
import 'package:doit/src/presentation/login/login_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
      required this.sessionGuard})
      : super(navigatorKey);

  final _i6.SessionGuard sessionGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    DashboardScreenRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.DashboardScreen());
    },
    AddTodoScreenRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.AddTodoScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login-screen', fullMatch: true),
        _i4.RouteConfig(LoginScreenRoute.name,
            path: '/login-screen', guards: [sessionGuard]),
        _i4.RouteConfig(DashboardScreenRoute.name, path: '/dashboard-screen'),
        _i4.RouteConfig(AddTodoScreenRoute.name, path: '/add-screen')
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i4.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(LoginScreenRoute.name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardScreenRoute extends _i4.PageRouteInfo<void> {
  const DashboardScreenRoute()
      : super(DashboardScreenRoute.name, path: '/dashboard-screen');

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [_i3.AddTodoScreen]
class AddTodoScreenRoute extends _i4.PageRouteInfo<void> {
  const AddTodoScreenRoute()
      : super(AddTodoScreenRoute.name, path: '/add-screen');

  static const String name = 'AddTodoScreenRoute';
}
