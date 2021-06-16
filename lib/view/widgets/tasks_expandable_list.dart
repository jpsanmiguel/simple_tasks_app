import 'package:flutter/material.dart';
import 'package:simple_tasks_app/data/models/task.dart';
import 'package:simple_tasks_app/view/widgets/task_widget.dart';

class TasksExpandableList extends StatefulWidget {
  final List<Task> tasks;
  final bool expanded;

  TasksExpandableList({
    Key key,
    @required this.tasks,
    @required this.expanded,
  }) : super(key: key);

  @override
  _TasksExpandableListState createState() => _TasksExpandableListState(
        tasks: this.tasks,
        expanded: this.expanded,
      );
}

class _TasksExpandableListState extends State<TasksExpandableList> {
  final List<Task> tasks;
  final bool expanded;

  _TasksExpandableListState({
    @required this.tasks,
    @required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionTile(
        initiallyExpanded: expanded,
        title: Text("${tasks[0].type}"),
        children: [
          _buildTasks(),
        ],
      ),
    );
  }

  Widget _buildTasks() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return TaskWidget(task: tasks[index]);
      },
      itemCount: tasks.length,
    );
  }
}
