part of 'daily_cubit.dart';

class DailyState {
  final String name;
  final String description;
  final int priority;
  final DateTime? deadline;

  DailyState({
    this.name = '"',
    this.description = "",
    this.priority = 0,
    this.deadline,
  });
}
