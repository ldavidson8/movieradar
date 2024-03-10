part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignInAsGuestEvent extends AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const SignUpEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class EmailVerificationSentEvent extends AuthenticationEvent {}

class EmailVerificationSuccessEvent extends AuthenticationEvent {}

class EmailVerificationFailedEvent extends AuthenticationEvent {
  final String errorMessage;

  const EmailVerificationFailedEvent({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PasswordResetRequestEvent extends AuthenticationEvent {
  final String email;

  const PasswordResetRequestEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordResetSuccessEvent extends AuthenticationEvent {}

class PasswordResetFailedEvent extends AuthenticationEvent {
  final String errorMessage;

  const PasswordResetFailedEvent({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SignOutEvent extends AuthenticationEvent {}

class AuthStateChangedEvent extends AuthenticationEvent {
  final User? user;

  const AuthStateChangedEvent({required this.user});

  @override
  List<Object> get props => [user ?? ''];
}
