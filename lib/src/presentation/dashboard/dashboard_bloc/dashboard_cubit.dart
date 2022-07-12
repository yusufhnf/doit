import 'dart:async';

import 'package:doit/src/infrastructure/data/remote/repository/auth_repository.dart';
import 'package:doit/src/infrastructure/data/remote/repository/todos_repository.dart';
import 'package:doit/src/infrastructure/models/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());
  final _todoRepository = TodosRepository();
  final _authRepository = AuthRepository();
  late final User currentUser;

  void getTodoData() async {
    emit(const DashboardState(dashboardStateType: DashboardStateType.loading));
    try {
      final result = await _todoRepository.getTodos();
      final currentUser = await _authRepository.getUser();
      if (currentUser != null) {
        emit(DashboardState(currentUser: currentUser));
      }
      result.listen((value) {
        if (value.isEmpty) {
          emit(const DashboardState(
              dashboardStateType: DashboardStateType.empty));
        } else {
          emit(DashboardState(
              dashboardStateType: DashboardStateType.success, todos: value));
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteTodo(TodoModel todo) async {
    try {
      await _todoRepository.deleteTodo(todo);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void changeTodoStatus(
      {required bool newValue, required TodoModel todo}) async {
    try {
      todo.isDone = newValue;
      await _todoRepository.updateTodoStatus(todo);
    } catch (e) {
      todo.isDone = !newValue;
    }
  }
}
