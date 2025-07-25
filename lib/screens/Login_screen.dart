import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import '../providers/task_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    final enteredEmail = _emailController.text.trim();
    final enteredPassword = _passwordController.text.trim();

    if (savedEmail == null || savedPassword == null) {
      // First time login - save credentials
      await prefs.setString('email', enteredEmail);
      await prefs.setString('password', enteredPassword);
      await prefs.setBool('loggedIn', true);
      _goToHome(enteredEmail);
    } else {
      // Validate credentials
      if (enteredEmail == savedEmail && enteredPassword == savedPassword) {
        await prefs.setBool('loggedIn', true);
        _goToHome(enteredEmail);
      } else {
        _showError('Invalid email or password');
      }
    }
  }

  void _goToHome(String email) {
    // Set the user email in the TaskProvider
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.setUserEmail(email); // You’ll define this method
    taskProvider.loadTasks();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
