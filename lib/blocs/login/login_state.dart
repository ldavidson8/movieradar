part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class NotLoggedIn extends LoginState {}

final class LoggingIn extends LoginState {}

final class LoggedIn extends LoginState {}

final class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
