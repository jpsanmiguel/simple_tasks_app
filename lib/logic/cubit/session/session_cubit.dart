import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:meta/meta.dart';
import 'package:simple_tasks_app/data/models/user.dart';
import 'package:simple_tasks_app/data/repositories/auth_repository.dart';

part 'session_state.dart';

class AuthSessionCubit extends Cubit<AuthSessionState> {
  final AuthRepository authRepository;

  AuthSessionCubit({
    @required this.authRepository,
  }) : super(UnknownSessionState()) {
    listenToAuthStateChanges();
  }

  void showAuth() => emit(UnauthenticatedSessionState());

  void showSession(User user) {
    emit(AuthenticatedSessionState(user: user));
  }

  void listenToAuthStateChanges() {
    firebaseAuth.FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      if (firebaseUser == null) {
        emit(UnauthenticatedSessionState());
      } else {
        User user = User(userId: firebaseUser.uid, displayName: firebaseUser.displayName, email: firebaseUser.email, photoUrl: firebaseUser.photoURL);
        emit(AuthenticatedSessionState(user: user));
      }
    });
  }

  void signOut() {}
}
