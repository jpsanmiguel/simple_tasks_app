import 'package:flutter/material.dart';
import 'package:simple_tasks_app/data/models/user.dart';

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
          child: Center(
            child: Text("This is main tasks page"),
          ),
        ),
      ),
    );
  }
}
