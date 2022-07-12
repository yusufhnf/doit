part of './dashboard_screen.dart';

class _DrawerView extends StatelessWidget {
  const _DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.dashboardStateType == DashboardStateType.loading) {
          return const LoadingView();
        }
        return Drawer(
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(state
                            .currentUser?.displayName ??
                        "https://i.pinimg.com/736x/68/16/3e/68163efb3c2201721d8e681cde6aef2b.jpg"),
                    radius: 40,
                  ),
                  title: const Text("Welcome"),
                  subtitle: Text(state.currentUser?.displayName ?? "-"),
                  onTap: () => AutoRouter.of(context).pop(),
                ),
                const Divider(),
                ListTile(
                  title: const Text(Strings.logOutLabel),
                  onTap: () {
                    AutoRouter.of(context).pop();
                    context.read<AuthenticationCubit>().signOut();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
