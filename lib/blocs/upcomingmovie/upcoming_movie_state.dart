part of 'upcoming_movie_cubit.dart';

sealed class UpcomingMovieState extends Equatable {
  const UpcomingMovieState();

  @override
  List<Object> get props => [];
}

final class UpcomingMovieInitial extends UpcomingMovieState {}

final class UpcomingMovieLoading extends UpcomingMovieState {}

final class UpcomingMovieLoaded extends UpcomingMovieState {
  final List<MovieModel> movies;

  const UpcomingMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class UpcomingMovieError extends UpcomingMovieState {
  final String message;

  const UpcomingMovieError(this.message);

  @override
  List<Object> get props => [message];
}
