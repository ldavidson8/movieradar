import 'package:movieradar/blocs/favouritemovies/favourite_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';
import 'package:movieradar/ui/widgets/movie_item.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteMoviesCubit()..getFavouriteMovies(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Favourites'),
        body: SafeArea(
          child: BlocBuilder<FavouriteMoviesCubit, FavouriteMoviesState>(
            builder: (context, state) {
              if (state is FavouriteMoviesLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is FavouriteMoviesError) {
                return Center(child: Text('Error: ${state.message}'));
              } else if (state is FavouriteMoviesLoaded) {
                final favouriteMovies = state.movies;
                if (favouriteMovies.isEmpty) {
                  return Center(child: Text('No favorite movies found.'));
                }
                return ListView.builder(
                  itemCount: favouriteMovies.length,
                  itemBuilder: (context, index) {
                    final movie = favouriteMovies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: MovieItem(
                        movie: MovieModel(
                          id: movie.id,
                          title: movie.title,
                          posterPath:
                              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                          genreIds:
                              movie.genres?.map((genre) => genre.id!).toList(),
                          voteAverage: movie.voteAverage,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        bottomNavigationBar: const AppBottomNavigation(),
      ),
    );
  }
}
