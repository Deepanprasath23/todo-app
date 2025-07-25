import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task_model.dart';

class LocalStorageService {
  // This generates a unique key per user
  static String _getTaskKey(String email) => 'tasks_$email';

  // Save tasks under a user's key
  static Future<void> saveTasks(String email, List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = tasks.map((task) => task.toJson()).toList();
    await prefs.setString(_getTaskKey(email), jsonEncode(taskList));
  }

  // Load tasks for a specific user
  static Future<List<Task>> loadTasks(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_getTaskKey(email));

    if (data == null) return [];

    final List<dynamic> decoded = jsonDecode(data);
    return decoded.map((json) => Task.fromJson(json)).toList();
  }
}
