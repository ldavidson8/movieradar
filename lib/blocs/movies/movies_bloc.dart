import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieradar/models/movie_model.dart';

import 'package:movieradar/repositories/tmdb_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final _tmdbRepository = TMDBRepository();
  MoviesBloc() : super(MoviesInitial()) {
    on<GetTrendingMoviesEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final movies = await _tmdbRepository.getTrendingMovies();
        emit(TrendingMoviesLoaded(movies));
      } catch (e) {
        emit(MoviesError('Failed to load trending movies'));
      }
    });

    on<GetUpcomingMoviesEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final movies = await _tmdbRepository.getUpcomingMovies();
        emit(UpcomingMoviesLoaded(movies));
      } catch (e) {
        emit(MoviesError('Failed to load upcoming movies'));
      }
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final movies = await _tmdbRepository.getTopMovies();
        emit(TopRatedMoviesLoaded(movies));
      } catch (e) {
        emit(MoviesError('Failed to load top rated movies'));
      }
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final movies = await _tmdbRepository.getPopularMovies();
        emit(PopularMoviesLoaded(movies));
      } catch (e) {
        emit(MoviesError('Failed to load popular movies'));
      }
    });

    on<GetNowPlayingMoviesEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final movies = await _tmdbRepository.getNowPlayingMovies();
        emit(NowPlayingMoviesLoaded(movies));
      } catch (e) {
        emit(MoviesError('Failed to load now playing movies'));
      }
    });

    on<GetMovieByGenreEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        // Implement the logic to get movies by genre using the TMDBRepository
        // final movies = await _tmdbRepository.getMoviesByGenre(event.genreId);
        // emit(MoviesLoaded(movies));
      } catch (e) {
        emit(MoviesError('Failed to load movies by genre'));
      }
    });
  }
}
