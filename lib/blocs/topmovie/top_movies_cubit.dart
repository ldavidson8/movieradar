import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';
import 'package:movieradar/utils/connectivity_checker.dart';

part 'top_movies_state.dart';

class TopMoviesCubit extends Cubit<TopMoviesState> {
  TopMoviesCubit() : super(TopMoviesInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  Future<void> getTopMovies(BuildContext context) async {
    await _connectivityChecker.checkConnectivity(
      context,
      () async {
        try {
          emit(TopMoviesLoading());
          final topMovies = await _tmdbRepository.getTopMovies();
          emit(TopMoviesLoaded(topMovies));
        } catch (e) {
          emit(TopMoviesError(e.toString()));
        }
      },
    );
  }
}
