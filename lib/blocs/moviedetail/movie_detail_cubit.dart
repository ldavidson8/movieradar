import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/models/movie_details.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';
import 'package:movieradar/utils/connectivity_checker.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  Future<MovieDetails?> getMovieDetails(int id, BuildContext context) async {
    await _connectivityChecker.checkConnectivity(context, () async {
      emit(MovieDetailLoading());
      try {
        final movie = await _tmdbRepository.getMovieDetails(id);
        emit(MovieDetailLoaded(movie));
        return movie;
      } catch (e) {
        emit(MovieDetailError(e.toString()));
      }
    });
    return null;
  }
}
