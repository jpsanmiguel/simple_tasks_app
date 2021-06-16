import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tasks_app/data/models/task.dart';
import 'package:simple_tasks_app/data/models/user.dart';
import 'package:simple_tasks_app/logic/bloc/tasks_bloc.dart';
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
    context.read<TasksBloc>().add(TasksFetch());

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            print("Loading status: ${state.loadingStatus}");
            if (state.loadingStatus == LoadingStatus.Success) {
              print("Success...");
              return RefreshIndicator(
                onRefresh: () async {
                  print('Something!');
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      TasksExpandableList(
                        tasks: state.dailyTasks,
                        expanded: true,
                      ),
                      TasksExpandableList(
                        tasks: state.weeklyTasks,
                        expanded: false,
                      ),
                      TasksExpandableList(
                        tasks: state.monthlyTasks,
                        expanded: false,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state.loadingStatus == LoadingStatus.Error) {
              print("Error...");
              return Center(
                child: Text('An error occurred while trying to retreive tasks list...'),
              );
            } else if (state.loadingStatus == LoadingStatus.Loading) {
              print("Loading...");
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            print("None...");
            return Container();
          },
        ),
      ),
    );
  }
}
