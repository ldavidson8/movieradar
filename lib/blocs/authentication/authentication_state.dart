part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  const Authenticated({required this.user});
  final User user;

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthenticationState {}

class EmailVerificationSent extends AuthenticationState {}

class EmailVerificationSuccess extends AuthenticationState {}

class EmailVerificationFailed extends AuthenticationState {
  const EmailVerificationFailed({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class PasswordResetRequestSuccess extends AuthenticationState {}

class PasswordResetFailed extends AuthenticationState {
  const PasswordResetFailed({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
