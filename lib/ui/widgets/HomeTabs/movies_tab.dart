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
        height: 350,
        autoPlay: true,
        aspectRatio: 1,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 0.9,
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          BlocBuilder<PopularMovieCubit, PopularMovieState>(
            builder: (context, state) {
              if (state is PopularMovieLoading) {
                return Container(
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
          SizedBox(height: 48),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Popular Movies',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(height: 10),
          BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
            builder: (context, state) {
              if (state is TrendingMovieLoading) {
                return Container(
                  height: 400,
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
      ),
    );
  }
}
