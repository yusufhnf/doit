import 'package:auto_route/auto_route.dart';
import 'package:doit/src/infrastructure/utils/constant/strings.dart';
import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({Key? key}) : super(key: key);
  static const route =
      AdaptiveRoute(path: '/add-screen', page: AddTodoScreen, initial: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Add title',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Describe your task...',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  const SizedBox(height: 32.0),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(Strings.addDateLabel),
                    onTap: () {},
                    trailing: Text(
                      "21 December 2021\n14.00",
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
                      onPressed: () {
                        AutoRouter.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text("SAVE"))),
            )
          ],
        ),
      ),
    );
  }
}
