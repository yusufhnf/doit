part of './dashboard_screen.dart';

class _TaskListView extends StatelessWidget {
  const _TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.dashboardStateType == DashboardStateType.loading) {
          return const LoadingView();
        } else if (state.dashboardStateType == DashboardStateType.empty) {
          return const EmptyView();
        } else if (state.dashboardStateType == DashboardStateType.success) {
          final todoResult = state.todos;
          return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) => TodoItem(
                    todo: todoResult[index],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16.0,
                  ),
              itemCount: todoResult.length);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
