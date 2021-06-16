import 'dart:convert';

import 'package:simple_tasks_app/data/models/task.dart';

class User {
  String userId;
  String displayName;
  String email;
  String photoUrl;
  List<Task> daily;
  List<Task> weekly;
  List<Task> monthly;

  User({
    this.userId,
    this.displayName,
    this.email,
    this.photoUrl,
    this.daily,
    this.weekly,
    this.monthly,
  });

  User.fromJson(Map<String, dynamic> json) {
    daily = <Task>[];
    weekly = <Task>[];
    monthly = <Task>[];
    userId = json['userId'];
    displayName = json['displayName'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    var tempDaily = json['daily'];
    if (tempDaily != null && tempDaily.toString().isNotEmpty) {
      tempDaily.forEach((task) => tempDaily.add(Task.fromJson(task)));
    }
    var tempWeekly = json['weekly'];
    if (tempWeekly != null && tempWeekly.toString().isNotEmpty) {
      tempWeekly.forEach((task) => tempWeekly.add(Task.fromJson(task)));
    }
    var tempMonthly = json['monthly'];
    if (tempMonthly != null && tempMonthly.toString().isNotEmpty) {
      tempMonthly.forEach((task) => tempMonthly.add(Task.fromJson(task)));
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
      'daily': jsonEncode(daily),
      'weekly': jsonEncode(weekly),
      'monthly': jsonEncode(monthly),
    };
  }
}
