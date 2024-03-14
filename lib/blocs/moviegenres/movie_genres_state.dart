part of 'movie_genres_cubit.dart';

sealed class MovieGenresState extends Equatable {
  const MovieGenresState();

  @override
  List<Object> get props => [];
}

final class MovieGenresInitial extends MovieGenresState {}

final class MovieGenresLoading extends MovieGenresState {}

final class MovieGenresLoaded extends MovieGenresState {
  final List<Genre> genres;
  const MovieGenresLoaded(this.genres);

  @override
  List<Object> get props => [genres];
}

final class MovieGenresError extends MovieGenresState {
  final String message;
  const MovieGenresError(this.message);

  @override
  List<Object> get props => [message];
}
