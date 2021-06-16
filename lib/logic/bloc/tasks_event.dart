part of 'tasks_bloc.dart';

abstract class TasksEvent {}

class TasksFetch extends TasksEvent {}

class TasksReset extends TasksEvent {}
