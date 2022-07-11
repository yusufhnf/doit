part of './dashboard_screen.dart';

class _DrawerView extends StatelessWidget {
  const _DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/68/16/3e/68163efb3c2201721d8e681cde6aef2b.jpg"),
                radius: 40,
              ),
              title: const Text("Welcome"),
              subtitle: const Text("Joe Doe"),
              onTap: () => AutoRouter.of(context).pop(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: const [
                  Expanded(
                      child: InfoContainerWidget(
                          label: Strings.allTaskLabel, count: 13)),
                  SizedBox(width: 8),
                  Expanded(
                      child: InfoContainerWidget(
                          label: Strings.taskDoneLabel, count: 2)),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Log out"),
              onTap: () {
                AutoRouter.of(context).pop();
                context.read<LoginCubit>().signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
