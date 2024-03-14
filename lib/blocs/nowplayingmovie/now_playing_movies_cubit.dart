import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit() : super(NowPlayingMoviesInitial());
  final TMDBRepository _tmdbRepository = TMDBRepository();

  Future<void> getNowPlayingMovies() async {
    try {
      emit(NowPlayingMoviesLoading());
      final movies = await _tmdbRepository.getNowPlayingMovies();
      emit(NowPlayingMoviesLoaded(movies));
    } catch (e) {
      emit(NowPlayingMoviesError(e.toString()));
    }
  }
}
