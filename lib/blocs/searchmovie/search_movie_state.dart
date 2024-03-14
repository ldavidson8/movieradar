part of 'search_movie_cubit.dart';

sealed class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

final class SearchMovieInitial extends SearchMovieState {}

final class SearchMovieLoading extends SearchMovieState {}

final class SearchMovieLoaded extends SearchMovieState {
  final List<MovieModel> movies;

  const SearchMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class SearchMovieError extends SearchMovieState {
  final String message;

  const SearchMovieError(this.message);

  @override
  List<Object> get props => [message];
}
