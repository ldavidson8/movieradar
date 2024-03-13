part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {
  const MoviesInitial();
}

class MoviesLoading extends MoviesState {
  const MoviesLoading();
}

class TrendingMoviesLoaded extends MoviesState {
  final List<MovieModel> movies;

  const TrendingMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class UpcomingMoviesLoaded extends MoviesState {
  final List<MovieModel> movies;

  const UpcomingMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class TopRatedMoviesLoaded extends MoviesState {
  final List<MovieModel> movies;

  const TopRatedMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class PopularMoviesLoaded extends MoviesState {
  final List<MovieModel> movies;

  const PopularMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class NowPlayingMoviesLoaded extends MoviesState {
  final List<MovieModel> movies;

  const NowPlayingMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MoviesByGenreLoaded extends MoviesState {
  final List<MovieModel> movies;

  const MoviesByGenreLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError(this.message);

  @override
  List<Object> get props => [message];
}
