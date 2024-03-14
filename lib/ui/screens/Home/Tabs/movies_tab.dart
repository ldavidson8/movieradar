import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieradar/blocs/popularmovie/popular_movie_cubit.dart';
import 'package:movieradar/blocs/topmovie/top_movies_cubit.dart';
import 'package:movieradar/blocs/trendingmovie/trendingmovie_cubit.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/ui/widgets/carousel_item.dart';
import 'package:movieradar/ui/widgets/movie_card.dart';
import 'package:movieradar/ui/widgets/movie_item.dart';

class MoviesTab extends StatelessWidget {
  const MoviesTab({super.key});

  _buildCarouselSlider(BuildContext context, List<MovieModel> movies) {
    return CarouselSlider(
      items: movies.sublist(0, 5).map((movie) {
        return CarouselItem(
          id: movie.id!,
          image: movie.posterPath!,
          title: movie.title ?? movie.originalTitle ?? 'No Title',
          overview: movie.overview!,
          rating: movie.voteAverage!,
        );
      }).toList(),
      options: CarouselOptions(
        height: 350,
        autoPlay: true,
        aspectRatio: 1,
        autoPlayInterval: Duration(seconds: 7),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
      ),
    );
  }

  _buildMovieSlider(BuildContext context, List<MovieModel> movies) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        itemBuilder: (context, index) {
          return MovieCard(
            id: movies[index].id!,
            posterPath: movies[index].posterPath!,
            title: movies[index].title,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  BlocBuilder<PopularMovieCubit, PopularMovieState>(
                    builder: (context, state) {
                      if (state is PopularMovieLoading) {
                        return const SizedBox(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is PopularMovieLoaded) {
                        return SizedBox(
                          child: _buildCarouselSlider(context, state.movies),
                        );
                      } else if (state is PopularMovieError) {
                        return SizedBox(
                          child: Center(
                            child: Text(state.message),
                          ),
                        );
                      } else {
                        return const SizedBox(
                          child: Text('Something went wrong'),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 48),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Popular Movies',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
                    builder: (context, state) {
                      if (state is TrendingMovieLoading) {
                        return const SizedBox(
                          height: 400,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is TrendingMovieLoaded) {
                        return _buildMovieSlider(context, state.movies);
                      } else if (state is TrendingMovieError) {
                        return SizedBox(
                            child: Center(
                          child: Text(state.message),
                        ));
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 32),
        ),
        BlocBuilder<TopMoviesCubit, TopMoviesState>(
          builder: (context, state) {
            if (state is TopMoviesLoaded) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final movie = state.movies[index];
                    return MovieItem(movie: movie);
                  },
                  childCount: state.movies.length,
                ),
              );
            } else if (state is TopMoviesLoading) {
              return SliverToBoxAdapter(
                child: Container(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: Container(),
              );
            }
          },
        ),
      ],
    );
  }
}
