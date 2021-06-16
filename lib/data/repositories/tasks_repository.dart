import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_tasks_app/data/models/task.dart';
import 'package:simple_tasks_app/data/models/user.dart';
import 'package:simple_tasks_app/utils/constants.dart';
import 'package:simple_tasks_app/utils/enums.dart';

class TasksRepository {
  final tasksRef = FirebaseFirestore.instance.collection(TASKS_REF);
  final usersRef = FirebaseFirestore.instance.collection(USERS_REF);

  saveDailyTaskToUser(User user, Task task) async {
    await _getUserTasksRefByPeriodTime(user.userId, task.type).add(task);
  }

  CollectionReference _getUserTasksRefByPeriodTime(String userId, TaskType periodTime) {
    if (periodTime == TaskType.Daily) {
      return _getUserTasksRef(userId, DAILY_TASKS_REF);
    } else if (periodTime == TaskType.Weekly) {
      return _getUserTasksRef(userId, WEEKLY_TASKS_REF);
    } else {
      return _getUserTasksRef(userId, MONTHLY_TASKS_REF);
    }
  }

  CollectionReference _getUserTasksRef(String userId, String subCollection) {
    return tasksRef.doc(userId).collection(subCollection).withConverter<Task>(
          fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()),
          toFirestore: (task, _) => task.toJson(),
        );
  }
}
