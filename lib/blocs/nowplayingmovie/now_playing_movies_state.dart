part of 'now_playing_movies_cubit.dart';

sealed class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

final class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

final class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

final class NowPlayingMoviesLoaded extends NowPlayingMoviesState {
  final List<MovieModel> movies;

  const NowPlayingMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class NowPlayingMoviesError extends NowPlayingMoviesState {
  final String message;

  const NowPlayingMoviesError(this.message);

  @override
  List<Object> get props => [message];
}
