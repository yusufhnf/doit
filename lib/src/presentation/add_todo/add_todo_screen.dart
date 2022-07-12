import 'package:auto_route/auto_route.dart';
import 'package:doit/src/infrastructure/helper/date_time_helper.dart';
import 'package:doit/src/infrastructure/navigation/routes.gr.dart';
import 'package:doit/src/infrastructure/utils/constant/strings.dart';
import 'package:doit/src/infrastructure/widgets/bottom_dialog.dart';
import 'package:doit/src/infrastructure/widgets/loading_dialog.dart';
import 'package:doit/src/presentation/add_todo/add_todo_bloc/add_todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({Key? key}) : super(key: key);
  static const route =
      AdaptiveRoute(path: '/add-screen', page: AddTodoScreen, initial: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.addTaskLabel),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider<AddTodoCubit>(
        create: (context) => AddTodoCubit(),
        child: BlocListener<AddTodoCubit, AddTodoState>(
          listener: (context, state) {
            if (state.addTodoType == AddTodoType.loading) {
              LoadingDialog.openDialog(context);
            } else if (state.addTodoType == AddTodoType.success) {
              LoadingDialog.close(context);
              AutoRouter.of(context)
                  .popUntilRouteWithName(DashboardScreenRoute.name);
              BottomDialog.showInformation(
                  context: context,
                  description: Strings.addTaskSuccessMessage,
                  isSuccess: true);
            } else if (state.addTodoType == AddTodoType.error) {
              LoadingDialog.close(context);
              BottomDialog.showInformation(
                  context: context,
                  description: Strings.failedLabel,
                  isSuccess: false);
            }
          },
          child: BlocBuilder<AddTodoCubit, AddTodoState>(
            builder: (context, state) {
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 5,
                            onChanged: (value) => context
                                .read<AddTodoCubit>()
                                .setContentText(value),
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: Strings.contentFormLabel,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          const SizedBox(height: 32.0),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(Strings.addDateLabel),
                            onTap: () => DatePicker.showDateTimePicker(context,
                                locale: LocaleType.id,
                                onConfirm: (dateTimeValue) => context
                                    .read<AddTodoCubit>()
                                    .setDateTime(dateTimeValue)),
                            trailing: Text(
                              context
                                  .watch<AddTodoCubit>()
                                  .deadlineTime
                                  .dayMonthYearHourMinuteDate(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () =>
                                  context.read<AddTodoCubit>().addTask(),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text(Strings.saveLabel))),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
