part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginAsGuest extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginWithGoogle extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginWithEmailAndPassword extends LoginEvent {
  final String email;
  final String password;

  const LoginWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignUpWithEmailAndPassword extends LoginEvent {
  final String email;
  final String password;

  const SignUpWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class Logout extends LoginEvent {
  @override
  List<Object> get props => [];
}
