part of 'trendingmovie_cubit.dart';

sealed class TrendingMovieState extends Equatable {
  const TrendingMovieState();

  @override
  List<Object> get props => [];
}

final class TrendingMovieInitial extends TrendingMovieState {}

final class TrendingMovieLoading extends TrendingMovieState {}

final class TrendingMovieLoaded extends TrendingMovieState {
  final List<MovieModel> movies;

  const TrendingMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class TrendingMovieError extends TrendingMovieState {
  final String message;

  const TrendingMovieError(this.message);

  @override
  List<Object> get props => [message];
}
