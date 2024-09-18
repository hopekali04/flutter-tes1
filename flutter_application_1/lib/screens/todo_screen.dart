import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final ApiService _apiService = ApiService();
  List<Task> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  void _fetchTasks() async {
    try {
      final tasks = await _apiService.getTasks();
      setState(() {
        _tasks = tasks;
      });
    } catch (e) {
      print('Error fetching tasks: $e');
    }
  }

  void _addTask() async {
    if (_controller.text.isNotEmpty) {
      try {
        final newTask = await _apiService.createTask(_controller.text);
        setState(() {
          _tasks.add(newTask);
          _controller.clear();
        });
      } catch (e) {
        print('Error adding task: $e');
      }
    }
  }

  void _deleteTask(Task task) async {
    try {
      await _apiService.deleteTask(task.id!);
      setState(() {
        _tasks.remove(task);
      });
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter a task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteTask(task),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
