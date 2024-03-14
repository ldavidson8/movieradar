import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/repositories/tmdb_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit() : super(SearchMovieInitial()) {
    _searchQuery
        .debounceTime(Duration(
            milliseconds: 500)) // Change this to adjust the debounce time.
        .distinct()
        .listen((query) {
      searchMovie(query);
    });
  }

  final TMDBRepository _tmdbRepository = TMDBRepository();
  final _searchQuery = BehaviorSubject<String>();

  void onSearchQueryChanged(String query) {
    _searchQuery.add(query);
  }

  Future<void> searchMovie(
    String query, {
    bool? includeAdult,
    String? language,
    int? primaryReleaseYear,
    int? page,
    String? region,
    int? year,
  }) async {
    try {
      emit(SearchMovieLoading());
      final List<MovieModel> movies = await _tmdbRepository.searchForMovies(
          query: query,
          includeAdult: includeAdult,
          language: language,
          primaryReleaseYear: primaryReleaseYear,
          page: page,
          region: region,
          year: year);
      emit(SearchMovieLoaded(movies));
    } catch (e) {
      emit(SearchMovieError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _searchQuery.close();
    return super.close();
  }
}
