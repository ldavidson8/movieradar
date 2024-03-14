part of 'favourite_movies_cubit.dart';

sealed class FavouriteMoviesState extends Equatable {
  const FavouriteMoviesState();

  @override
  List<Object> get props => [];
}

final class FavouriteMoviesInitial extends FavouriteMoviesState {}

final class FavouriteMoviesLoading extends FavouriteMoviesState {}

final class FavouriteMoviesLoaded extends FavouriteMoviesState {
  final List<MovieDetails> movies;
  const FavouriteMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class FavouriteMoviesError extends FavouriteMoviesState {
  final String message;
  const FavouriteMoviesError(this.message);

  @override
  List<Object> get props => [message];
}
