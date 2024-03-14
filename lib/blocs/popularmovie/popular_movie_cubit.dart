import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';

part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit() : super(PopularMovieInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();

  Future<void> getPopularMovies() async {
    try {
      emit(PopularMovieLoading());
      final movies = await _tmdbRepository.getPopularMovies();
      emit(PopularMovieLoaded(movies));
    } catch (e) {
      emit(PopularMovieError(e.toString()));
    }
  }
}
