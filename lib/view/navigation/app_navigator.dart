import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_tasks_app/logic/cubit/session/session_cubit.dart';
import 'package:simple_tasks_app/view/screens/login_page.dart';
import 'package:simple_tasks_app/view/screens/main_page.dart';
import 'package:simple_tasks_app/view/screens/splash_page.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSessionCubit, AuthSessionState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            if (state is UnknownSessionState) MaterialPage(child: SplashPage()),
            if (state is UnauthenticatedSessionState) MaterialPage(child: LoginPage()),
            if (state is AuthenticatedSessionState)
              MaterialPage(
                child: MainPage(
                  user: state.user,
                ),
              ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      },
    );
  }
}
