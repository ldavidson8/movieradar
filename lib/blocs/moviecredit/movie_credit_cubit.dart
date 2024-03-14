import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieradar/models/movie_cast/movie_cast.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';

part 'movie_credit_state.dart';

class MovieCreditCubit extends Cubit<MovieCreditState> {
  MovieCreditCubit() : super(MovieCreditInitial());

  final TMDBRepository _tmdbRepository = TMDBRepository();

  Future<void> getMovieCredits(int movieId) async {
    try {
      emit(MovieCreditLoading());
      final movieCredits = await _tmdbRepository.getMovieCredits(movieId);
      emit(MovieCreditLoaded(movieCredits));
    } catch (e) {
      emit(MovieCreditError(e.toString()));
    }
  }
}
