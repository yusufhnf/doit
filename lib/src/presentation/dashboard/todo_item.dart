import 'package:doit/src/infrastructure/helper/date_time_helper.dart';
import 'package:doit/src/infrastructure/models/todo_model.dart';
import 'package:doit/src/presentation/dashboard/dashboard_bloc/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title ?? "Untitled",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 8.0),
                Text(
                  todo.dateDeadline?.toDate().dayMonthYearHourMinuteDate() ??
                      "-",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Checkbox(
            checkColor: Colors.black,
            value: todo.isDone,
            onChanged: (newValue) {
              BlocProvider.of<DashboardCubit>(context)
                  .changeTodoStatus(newValue: newValue ?? false, todo: todo);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          )
        ],
      ),
    );
  }
}
