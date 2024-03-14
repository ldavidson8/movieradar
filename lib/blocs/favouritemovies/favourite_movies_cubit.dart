import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieradar/data/database_helper.dart';
import 'package:movieradar/models/movie_details.dart';

part 'favourite_movies_state.dart';

class FavouriteMoviesCubit extends Cubit<FavouriteMoviesState> {
  FavouriteMoviesCubit() : super(FavouriteMoviesInitial());

  final _dbHelper = DatabaseHelper.instance;

  void getFavouriteMovies() async {
    try {
      emit(FavouriteMoviesLoading());
      final movies = await _dbHelper.getFavouriteMovies();
      emit(FavouriteMoviesLoaded(movies));
    } catch (e) {
      emit(FavouriteMoviesError(e.toString()));
    }
  }
}
