import 'package:cached_network_image/cached_network_image.dart';
import 'package:movieradar/blocs/favouritemovies/favourite_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';
import 'package:movieradar/models/movie_details.dart';
import 'package:movieradar/data/database_helper.dart';
import 'package:movieradar/ui/widgets/custom_shimmer.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favourites'),
      body: SafeArea(
        child: BlocProvider<FavouriteMoviesCubit>(
          create: (context) => FavouriteMoviesCubit(),
          child: BlocBuilder<FavouriteMoviesCubit, FavouriteMoviesState>(
            builder: (context, state) {
              if (state is FavouriteMoviesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FavouriteMoviesLoaded) {
                return ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    final movie = state.movies[index];
                    return ListTile(
                      leading: Icon(Icons.movie),
                      title: Text(movie.title!),
                      subtitle: Text(movie.overview!),
                      trailing: Text('Runtime: ${movie.runtime} min'),
                    );
                  },
                );
              }
              if (state is FavouriteMoviesError) {
                return Text(state.message);
              } else {
                return const Center(
                  child: Text('No favourites found'),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}
