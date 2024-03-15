import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial) {
    on<AuthStateChanged>(_handleAuthStateChanged);

    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          add(const AuthStateChanged(authState: AuthState.unauthenticated));
        } else {
          add(const AuthStateChanged(authState: AuthState.authenticated));
        }
      },
    );
  }

  Future<void> _handleAuthStateChanged(
    AuthStateChanged event,
    Emitter<AuthState> emit,
  ) async =>
      emit(event.authState);
}
