import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieradar/blocs/trendingmovie/trendingmovie_cubit.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/ui/widgets/movie_card.dart';

class NewTrendingTab extends StatelessWidget {
  const NewTrendingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrendingMovieCubit>(
      create: (context) => TrendingMovieCubit()..getTrendingMovies(context),
      child: BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
        builder: (context, state) {
          if (state is TrendingMovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TrendingMovieLoaded) {
            List<MovieModel> movies = state.movies;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 5,
                crossAxisSpacing: 10,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Center(
                      child: MovieCard(
                        id: movies[index].id!,
                        posterPath: movies[index].posterPath!,
                        title: movies[index].title,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          if (state is TrendingMovieError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
