part of 'add_todo_cubit.dart';

enum AddTodoType { initial, loading, success, error }

class AddTodoState extends Equatable {
  const AddTodoState(
      {this.addTodoType = AddTodoType.initial,
      this.contentText,
      this.deadlineTime});

  final AddTodoType addTodoType;
  final String? contentText;
  final DateTime? deadlineTime;

  String get getContentText => contentText ?? '';
  DateTime get getDeadlineTime => deadlineTime ?? DateTime.now();

  @override
  List<Object> get props =>
      [addTodoType, contentText ?? '', deadlineTime ?? DateTime.now()];

  AddTodoState copyWith(
      {AddTodoType? addTodoTypeValue,
      String? contentTextValue,
      DateTime? deadlineTimeValue}) {
    return AddTodoState(
        addTodoType: addTodoTypeValue ?? addTodoType,
        contentText: contentTextValue ?? contentText,
        deadlineTime: deadlineTimeValue);
  }
}
