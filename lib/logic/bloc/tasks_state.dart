part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final LoadingStatus loadingStatus;
  final List<Task> dailyTasks;
  final List<Task> weeklyTasks;
  final List<Task> monthlyTasks;

  TasksState({
    this.loadingStatus = LoadingStatus.None,
    this.dailyTasks,
    this.weeklyTasks,
    this.monthlyTasks,
  });

  TasksState copyWith({
    LoadingStatus loadingStatus,
    List<Task> dailyTasks,
    List<Task> weeklyTasks,
    List<Task> monthlyTasks,
  }) {
    return TasksState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      dailyTasks: dailyTasks ?? this.dailyTasks,
      weeklyTasks: weeklyTasks ?? this.weeklyTasks,
      monthlyTasks: monthlyTasks ?? this.monthlyTasks,
    );
  }

  @override
  List<Object> get props => [loadingStatus, dailyTasks, weeklyTasks, monthlyTasks];
}
