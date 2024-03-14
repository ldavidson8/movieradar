part of 'movie_credit_cubit.dart';

sealed class MovieCreditState extends Equatable {
  const MovieCreditState();

  @override
  List<Object> get props => [];
}

final class MovieCreditInitial extends MovieCreditState {}

final class MovieCreditLoading extends MovieCreditState {}

final class MovieCreditLoaded extends MovieCreditState {
  final MovieCast movieCast;
  const MovieCreditLoaded(this.movieCast);

  @override
  List<Object> get props => [movieCast];
}

final class MovieCreditError extends MovieCreditState {
  final String message;
  const MovieCreditError(this.message);

  @override
  List<Object> get props => [message];
}
