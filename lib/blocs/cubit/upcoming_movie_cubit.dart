import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';

part 'upcoming_movie_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMovieState> {
  UpcomingMoviesCubit() : super(UpcomingMovieInitial());
  final TMDBRepository _tmdbRepository = TMDBRepository();

  Future<void> getUpcomingMovies() async {
    try {
      emit(UpcomingMovieLoading());
      final movies = await _tmdbRepository.getUpcomingMovies();
      emit(UpcomingMovieLoaded(movies));
    } catch (e) {
      emit(UpcomingMovieError(e.toString()));
    }
  }
}
