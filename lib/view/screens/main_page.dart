import 'package:flutter/material.dart';
import 'package:simple_tasks_app/data/models/task.dart';
import 'package:simple_tasks_app/data/models/user.dart';
import 'package:simple_tasks_app/utils/enums.dart';
import 'package:simple_tasks_app/view/widgets/tasks_expandable_list.dart';

class MainPage extends StatefulWidget {
  final User user;
  MainPage({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState(user: this.user);
}

class _MainPageState extends State<MainPage> {
  final User user;

  _MainPageState({@required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            print('Something!');
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TasksExpandableList(
                    tasks: mockTaskList(),
                    expanded: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Task> mockTaskList() {
    List<Task> tasks = [];
    tasks.add(Task(name: "name1", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name2", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name3", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name4", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name5", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name6", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name7", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name8", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name9", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name10", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name11", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name12", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name13", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name14", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    tasks.add(Task(name: "name15", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: TaskType.Daily, comments: []));
    return tasks;
  }
}
