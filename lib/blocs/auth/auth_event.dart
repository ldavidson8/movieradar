part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStateChanged extends AuthEvent {
  final AuthState authState;
  const AuthStateChanged({required this.authState});

  @override
  List<Object> get props => [authState];
}
