import 'dart:convert';

import 'package:simple_tasks_app/data/models/comment.dart';
import 'package:simple_tasks_app/utils/enums.dart';

class Task {
  String name;
  String description;
  TaskType type;
  int dedicationHours;
  int dedicatedHours;
  int priority;
  List<Comment> comments;

  Task({this.name, this.description, this.type, this.dedicationHours, this.dedicatedHours, this.priority, this.comments});

  Task.fromJson(Map<String, dynamic> json) {
    comments = <Comment>[];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    dedicationHours = json['dedicationHours'];
    dedicatedHours = json['dedicatedHours'];
    priority = json['priority'];
    var tempComments = json['comments'];
    if (tempComments != null && tempComments.toString().isNotEmpty) {
      tempComments.forEach((comment) => comments.add(Comment.fromJson(comment)));
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'type': type,
      'dedicationHours': dedicationHours,
      'dedicatedHours': dedicatedHours,
      'priority': priority,
      'comments': jsonEncode(comments),
    };
  }
}
