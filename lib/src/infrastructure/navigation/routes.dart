import 'package:auto_route/auto_route.dart';
import 'package:doit/src/presentation/add_todo/add_todo_screen.dart';
import 'package:doit/src/presentation/dashboard/dashboard_screen.dart';
import 'package:doit/src/presentation/login/login_screen.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  LoginScreen.route,
  DashboardScreen.route,
  AddTodoScreen.route
])
class $AppRouter {}
