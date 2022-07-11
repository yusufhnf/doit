import 'package:auto_route/auto_route.dart';
import 'package:doit/src/infrastructure/data/local/preference_storage.dart';
import 'package:doit/src/infrastructure/data/remote/repository/auth_repository.dart';
import 'package:doit/src/infrastructure/navigation/routes.gr.dart';

class SessionGuard extends AutoRouteGuard {
  final AuthRepository _authRepository = AuthRepository();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isHaveToken = await _authRepository.getUserToken();
    if (isHaveToken != null) {
      router.replace(const DashboardScreenRoute());
    } else {
      resolver.next(true);
    }
  }
}
