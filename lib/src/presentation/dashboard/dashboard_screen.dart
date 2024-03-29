import 'package:auto_route/auto_route.dart';
import 'package:doit/src/infrastructure/navigation/routes.gr.dart';
import 'package:doit/src/infrastructure/utils/constant/strings.dart';
import 'package:doit/src/infrastructure/widgets/empty_view.dart';
import 'package:doit/src/infrastructure/widgets/info_container_widget.dart';
import 'package:doit/src/infrastructure/widgets/loading_view.dart';
import 'package:doit/src/presentation/dashboard/dashboard_bloc/dashboard_cubit.dart';
import 'package:doit/src/presentation/dashboard/todo_item.dart';
import 'package:doit/src/presentation/login/login_bloc/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../infrastructure/widgets/loading_dialog.dart';

part './_drawer_view.dart';
part './_task_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const route = AdaptiveRoute(
      path: '/dashboard-screen', page: DashboardScreen, initial: true);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit()..getTodoData(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.yourTaskLabel),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await AutoRouter.of(context).push(const AddTodoScreenRoute());
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Ionicons.add_outline,
            color: Colors.white,
          ),
        ),
        drawer: const _DrawerView(),
        body: BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state.loginProcess == LoginProcess.success) {
              LoadingDialog.close(context);
              AutoRouter.of(context).replace(const LoginScreenRoute());
            } else if (state.loginProcess == LoginProcess.loading) {
              LoadingDialog.openDialog(context);
            } else if (state.loginProcess == LoginProcess.error) {
              LoadingDialog.close(context);
            }
          },
          child: const _TaskListView(),
        ),
      ),
    );
  }
}
