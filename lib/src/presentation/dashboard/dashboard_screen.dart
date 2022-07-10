import 'package:auto_route/auto_route.dart';
import 'package:doit/src/infrastructure/navigation/routes.gr.dart';
import 'package:doit/src/infrastructure/utils/constant/strings.dart';
import 'package:doit/src/infrastructure/widgets/info_container_widget.dart';
import 'package:doit/src/presentation/dashboard/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

part './_drawer_view.dart';
part './_task_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const route = AdaptiveRoute(
      path: '/dashboard-screen', page: DashboardScreen, initial: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.yourTaskLabel),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const AddTodoScreenRoute());
        },
        backgroundColor: Colors.blue,
        child: const Icon(Ionicons.add_outline),
      ),
      drawer: const _DrawerView(),
      body: const _TaskListView(),
    );
  }
}
