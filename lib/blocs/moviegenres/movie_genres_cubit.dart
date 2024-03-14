import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/models/genre.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';
import 'package:movieradar/utils/connectivity_checker.dart';

part 'movie_genres_state.dart';

class MovieGenresCubit extends Cubit<MovieGenresState> {
  MovieGenresCubit() : super(MovieGenresInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  Future<void> getMovieGenres(BuildContext context) async {
    await _connectivityChecker.checkConnectivity(context, () async {
      try {
        emit(MovieGenresLoading());
        final List<Genre> genres = await _tmdbRepository.getMovieGenres();
        emit(MovieGenresLoaded(genres));
      } catch (e) {
        emit(MovieGenresError(e.toString()));
      }
    });
  }

  List<String> getGenreNames(List<int>? genreIds, Map<int, String> genres) {
    if (genreIds == null) return [];

    return genreIds
        .map((id) => genres[id])
        .where((name) => name != null)
        .toList()
        .cast<String>();
  }
}
