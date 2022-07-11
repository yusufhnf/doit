import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doit/src/infrastructure/data/local/preference_storage.dart';
import 'package:doit/src/infrastructure/models/todo_model.dart';
import 'package:geolocator/geolocator.dart';

class FirestoreTodoService {
  final _firestore = FirebaseFirestore.instance;
  final _preference = PreferenceStorage();

  Future<Stream<List<TodoModel>>> streamTodo() async {
    final userId = await _preference.getToken();
    return _firestore
        .collection("users")
        .doc(userId)
        .collection("todos")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> retVal = [];
      for (var item in query.docs) {
        retVal.add(TodoModel.fromDocumentSnapshot(documentSnapshot: item));
      }
      return retVal;
    });
  }

  Future<bool> addTodo({required TodoModel newTodo, Position? latLong}) async {
    try {
      final userId = await _preference.getToken();
      await _firestore
          .collection("users")
          .doc(userId)
          .collection("todos")
          .add(newTodo.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTodo(TodoModel todo) async {
    try {
      final userId = await _preference.getToken();
      await _firestore
          .collection("users")
          .doc(userId)
          .collection("todos")
          .doc(todo.todoId)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateTodoStatus(TodoModel todo) async {
    try {
      final userId = await _preference.getToken();
      final newStatus = !(todo.isDone ?? false);
      await _firestore
          .collection("users")
          .doc(userId)
          .collection("todos")
          .doc(todo.todoId)
          .update({"done": newStatus});
      return true;
    } catch (e) {
      return false;
    }
  }
}
