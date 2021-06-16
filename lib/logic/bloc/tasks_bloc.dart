import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_tasks_app/data/models/task.dart';
import 'package:simple_tasks_app/utils/enums.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState());

  @override
  Stream<TasksState> mapEventToState(
    TasksEvent event,
  ) async* {
    if (event is TasksFetch) {
      yield (state.copyWith(
        loadingStatus: LoadingStatus.Loading,
      ));
      yield (state.copyWith(
        dailyTasks: await mockTaskList(TaskType.Daily),
        weeklyTasks: await mockTaskList(TaskType.Weekly),
        monthlyTasks: await mockTaskList(TaskType.Monthly),
        loadingStatus: LoadingStatus.Success,
      ));
    }
  }

  Future<List<Task>> mockTaskList(TaskType taskType) async {
    List<Task> tasks = [];
    tasks.add(Task(name: "name1", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: taskType, comments: []));
    tasks.add(Task(name: "name2", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: taskType, comments: []));
    tasks.add(Task(name: "name3", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: taskType, comments: []));
    tasks.add(Task(name: "name4", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: taskType, comments: []));
    tasks.add(Task(name: "name5", description: "description", dedicatedHours: 2, dedicationHours: 2, priority: 10, type: taskType, comments: []));
    return await Future.delayed(Duration(milliseconds: 500), () {
      return tasks;
    });
  }
}
