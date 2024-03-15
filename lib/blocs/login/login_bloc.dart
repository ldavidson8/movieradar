import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginBloc() : super(NotLoggedIn()) {
    on<LoginAsGuest>(_onLoginAsGuest);
    on<LoginWithEmailAndPassword>(_onLoginWithEmailAndPassword);
    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);
    // on<LoginWithGoogle>(_onLoginWithGoogle);
  }

  Future<void> _onLoginAsGuest(
    LoginAsGuest event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoggingIn());
    try {
      await _auth.signInAnonymously();
      emit(LoggedIn());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.message!));
    }
  }

  Future<void> _onLoginWithEmailAndPassword(
      LoginWithEmailAndPassword event, Emitter<LoginState> emit) async {
    emit(LoggingIn());

    try {
      await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(LoggedIn());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.message ?? 'Unknown error'));
    }
  }

  Future<void> _onSignUpWithEmailAndPassword(
      SignUpWithEmailAndPassword event, Emitter<LoginState> emit) async {
    emit(LoggingIn());

    try {
      await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(LoggedIn());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.message ?? 'Unknown error'));
    }
  }

  // Future<void> _onLoginWithGoogle (LoginWithGoogle event, Emitter<LoginState> emit) async {
  //   emit(LoginLoading());

  //   try {
  //     await _auth.signInWithCredential(event.credential);
  //     emit(LoginSuccess());
  //   } on FirebaseAuthException catch (e) {
  //     emit(LoginError(e.message!));
  //   }
}
