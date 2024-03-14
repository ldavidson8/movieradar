import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';
import 'package:movieradar/utils/connectivity_checker.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit() : super(NowPlayingMoviesInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  Future<void> getNowPlayingMovies(BuildContext context) async {
    await _connectivityChecker.checkConnectivity(
      context,
      () async {
        try {
          emit(NowPlayingMoviesLoading());
          final movies = await _tmdbRepository.getNowPlayingMovies();
          emit(NowPlayingMoviesLoaded(movies));
        } catch (e) {
          emit(NowPlayingMoviesError(e.toString()));
        }
      },
    );
  }
}
