part of 'top_movies_cubit.dart';

sealed class TopMoviesState extends Equatable {
  const TopMoviesState();

  @override
  List<Object> get props => [];
}

final class TopMoviesInitial extends TopMoviesState {}

final class TopMoviesLoading extends TopMoviesState {}

final class TopMoviesLoaded extends TopMoviesState {
  final List<MovieModel> movies;

  const TopMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class TopMoviesError extends TopMoviesState {
  final String message;

  const TopMoviesError(this.message);

  @override
  List<Object> get props => [message];
}
