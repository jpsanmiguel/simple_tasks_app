import 'package:flutter/material.dart';
import 'package:simple_tasks_app/data/models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({Key key, @required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${task.name}"),
        subtitle: Text("${task.description}"),
        trailing: Text("Added hour"),
      ),
    );
  }
}
