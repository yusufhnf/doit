import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doit/src/infrastructure/data/local/preference_storage.dart';
import 'package:doit/src/infrastructure/data/remote/repository/todos_repository.dart';
import 'package:doit/src/infrastructure/models/todo_model.dart';
import 'package:doit/src/infrastructure/utils/geolocator_utils.dart';
import 'package:doit/src/infrastructure/utils/local_notification_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit() : super(const AddTodoState());
  final TodosRepository _todosRepository = TodosRepository();
  final GeolocatorUtils _geolocatorUtils = GeolocatorUtils();
  final LocalNotificationUtil _notificationUtil = LocalNotificationUtil();
  final PreferenceStorage _preferenceStorage = PreferenceStorage();
  String contentText = '';

  final _contentController = BehaviorSubject<String>();
  Stream<String> get contentStream => _contentController.stream;

  DateTime get deadlineTime => state.deadlineTime ?? DateTime.now();

  void setDateTime(DateTime newDate) =>
      emit(AddTodoState(deadlineTime: newDate));

  void setContentText(String newValue) {
    contentText = newValue;
    emit(AddTodoState(contentText: newValue));
  }

  void addTask() async {
    emit(const AddTodoState(addTodoType: AddTodoType.loading));
    try {
      await _geolocatorUtils.checkPermission();
      final position = await _geolocatorUtils.getLatLongCurrentLocation();
      final notificationId = await _preferenceStorage.getNotificationId();
      final newTodo = TodoModel(
          title: contentText,
          dateCreated: Timestamp.fromDate(DateTime.now()),
          dateDeadline: Timestamp.fromDate(deadlineTime),
          isDone: false,
          lat: position.latitude.toInt(),
          long: position.longitude.toInt(),
          notificationId: int.parse(notificationId ?? "0"));
      await _todosRepository.addTodos(newTodo);
      await _notificationUtil.showNotification(
          id: notificationId,
          body: contentText,
          dateTime:
              tz.TZDateTime.from(deadlineTime, tz.getLocation('Asia/Jakarta')));
      emit(const AddTodoState(addTodoType: AddTodoType.success));
    } catch (e) {
      emit(const AddTodoState(addTodoType: AddTodoType.error));
    }
  }
}
