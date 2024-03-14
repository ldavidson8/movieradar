import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';

part 'trendingmovies_state.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  TrendingMovieCubit() : super(TrendingMovieInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();

  Future<void> getTrendingMovies() async {
    try {
      emit(TrendingMovieLoading());
      final trendingMovies = await _tmdbRepository.getTrendingMovies();
      emit(TrendingMovieLoaded(trendingMovies));
    } catch (e) {
      emit(TrendingMovieError(e.toString()));
    }
  }
}
