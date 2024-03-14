import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';
import 'package:movieradar/utils/connectivity_checker.dart';

part 'trendingmovie_state.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  TrendingMovieCubit() : super(TrendingMovieInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  Future<void> getTrendingMovies(BuildContext context) async {
    await _connectivityChecker.checkConnectivity(
      context,
      () async {
        try {
          emit(TrendingMovieLoading());
          final trendingMovies = await _tmdbRepository.getTrendingMovies();
          emit(TrendingMovieLoaded(trendingMovies));
        } catch (e) {
          emit(TrendingMovieError(e.toString()));
        }
      },
    );
  }
}
