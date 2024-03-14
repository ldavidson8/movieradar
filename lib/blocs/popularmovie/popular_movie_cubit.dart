import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';
import 'package:movieradar/utils/connectivity_checker.dart';

part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit() : super(PopularMovieInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  Future<void> getPopularMovies(BuildContext context) async {
    await _connectivityChecker.checkConnectivity(context, () async {
      try {
        emit(PopularMovieLoading());
        final movies = await _tmdbRepository.getPopularMovies();
        emit(PopularMovieLoaded(movies));
      } catch (e) {
        emit(PopularMovieError(e.toString()));
      }
    });
  }
}
