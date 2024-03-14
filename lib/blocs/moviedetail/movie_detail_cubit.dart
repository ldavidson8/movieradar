import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieradar/models/movie_details.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();

  Future<MovieDetails> getMovieDetails(int id) async {
    emit(MovieDetailLoading());
    final movie = await _tmdbRepository.getMovieDetails(id);
    emit(MovieDetailLoaded(movie));
    return movie;
  }
}
