part of 'dashboard_cubit.dart';

enum DashboardStateType { initial, loading, success, empty, error }

class DashboardState extends Equatable {
  const DashboardState(
      {this.dashboardStateType = DashboardStateType.initial,
      this.todos = const []});

  final DashboardStateType dashboardStateType;
  final List<TodoModel> todos;

  @override
  List<Object> get props => [dashboardStateType, todos];

  DashboardState copyWith(
      {DashboardStateType? dashboardStateTypeValue,
      List<TodoModel>? todoValue}) {
    return DashboardState(
        dashboardStateType: dashboardStateTypeValue ?? dashboardStateType,
        todos: todoValue ?? todos);
  }
}
