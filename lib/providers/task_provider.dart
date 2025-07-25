import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import '../services/local_storage_service.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  String? _userEmail; // Holds the current user's email

  List<Task> get tasks => _tasks;

  // Set the current user email and load tasks for that user
  void setUserEmail(String email) {
    _userEmail = email;
    loadTasks();
  }

  void addTask(Task task) {
    _tasks.add(task);
    _saveTasks();
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    _saveTasks();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    _saveTasks();
    notifyListeners();
  }

  Future<void> loadTasks() async {
    if (_userEmail == null) return;
    _tasks = await LocalStorageService.loadTasks(_userEmail!);
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    if (_userEmail == null) return;
    await LocalStorageService.saveTasks(_userEmail!, _tasks);
  }
}
