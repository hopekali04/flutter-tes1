import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Flutter App 1',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing checklist"),
      ),
      body: const Column(
        children: [Progress()],
      ),
    );
  }
}

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Here is the Data to be displayed"),
        LinearProgressIndicator(value: 0.0,)
      ],
    );
  }
}
class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TaskItem(label: "Task1"),
        TaskItem(label: "Task2"),
        TaskItem(label: "Task3"),
        TaskItem(label: "Task4"),
        TaskItem(label: "Task5"),
        TaskItem(label: "Task6"),
      ],
    )
  }
}
class TaskItem extends StatelessWidget {
  final String label;

  const TaskItem ({Key key, @required this.label}) : super(key, key)
  
  @override
  Widget build(BuildContext context) {
    return Row (children: [
      const Checkbox(value: false, onChanged: null),
      Text(label),
    ],);
  }

}

