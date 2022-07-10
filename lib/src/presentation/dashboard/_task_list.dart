part of './dashboard_screen.dart';

class _TaskListView extends StatelessWidget {
  const _TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) => const TodoItem(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 16.0,
            ),
        itemCount: 6);
  }
}
