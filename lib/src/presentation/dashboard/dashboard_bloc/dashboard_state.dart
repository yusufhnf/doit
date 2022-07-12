part of 'dashboard_cubit.dart';

enum DashboardStateType { initial, loading, success, empty, error }

class DashboardState extends Equatable {
  const DashboardState(
      {this.dashboardStateType = DashboardStateType.initial,
      this.todos = const [],
      this.currentUser});

  final DashboardStateType dashboardStateType;
  final List<TodoModel> todos;
  final User? currentUser;

  @override
  List<Object> get props => [dashboardStateType, todos, currentUser ?? User];

  DashboardState copyWith(
      {DashboardStateType? dashboardStateTypeValue,
      List<TodoModel>? todoValue,
      User? currentUserValue}) {
    return DashboardState(
        dashboardStateType: dashboardStateTypeValue ?? dashboardStateType,
        todos: todoValue ?? todos,
        currentUser: currentUserValue);
  }
}
