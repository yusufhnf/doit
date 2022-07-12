import '../../../models/todo_model.dart';
import '../firestore_todo_service.dart';

class TodosRepository {
  final _firebaseTodo = FirestoreTodoService();

  Future<Stream<List<TodoModel>>> getTodos() async {
    final result = await _firebaseTodo.streamTodo();
    return result;
  }

  Future<bool> addTodos(TodoModel newTodo) async {
    final result = await _firebaseTodo.addTodo(newTodo: newTodo);
    return result;
  }

  Future<bool> deleteTodo(TodoModel todo) async {
    final result = await _firebaseTodo.deleteTodo(todo);
    return result;
  }

  Future<bool> updateTodoStatus(TodoModel todo) async {
    final result = await _firebaseTodo.updateTodoStatus(todo);
    return result;
  }
}
