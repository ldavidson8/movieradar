import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieradar/blocs/popularmovie/popular_movie_cubit.dart';
import 'package:movieradar/blocs/trendingmovie/trendingmovies_cubit.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/ui/widgets/carousel_item.dart';
import 'package:movieradar/ui/widgets/movie_card.dart';

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
        autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: true,
      ),
    );
  }

  _buildMovieSlider(BuildContext context, List<MovieModel> movies) {
    return Container(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<PopularMovieCubit, PopularMovieState>(
          builder: (context, state) {
            if (state is PopularMovieLoading) {
              return Container(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is PopularMovieLoaded) {
              return Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    _buildCarouselSlider(context, state.movies),
                  ],
                ),
              );
            } else if (state is PopularMovieError) {
              return Container(
                child: Center(
                  child: Text(state.message),
                ),
              );
            } else {
              return Container(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
        SizedBox(height: 10),
        Text('Popular Movies', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 10),
        BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
          builder: (context, state) {
            if (state is TrendingMovieLoading) {
              return Container(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is TrendingMovieLoaded) {
              return _buildMovieSlider(context, state.movies);
            } else if (state is TrendingMovieError) {
              return Container(
                  child: Center(
                child: Text(state.message),
              ));
            } else {
              return Container(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ],
    );
  }
}
