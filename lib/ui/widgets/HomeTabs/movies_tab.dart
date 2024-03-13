import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/blocs/movies/movies_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/ui/widgets/carousel_item.dart';

class MoviesTab extends StatelessWidget {
  const MoviesTab({super.key});

  _buildCarouselSlider(List<MovieModel> movies) {
    return CarouselSlider(
      items: movies.sublist(0, 5).map((movie) {
        return CarouselItem(
            image: movie.backdropPath,
            title: movie.title!,
            overview: movie.overview!,
            rating: movie.voteAverage!,
            onTap: () => print(movie.title));
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<MoviesBloc>().add(GetPopularMoviesEvent());
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoading) {
          return Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PopularMoviesLoaded) {
          return Container(
            child: _buildCarouselSlider(state.movies),
          );
        } else if (state is MoviesError) {
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
    );
  }
}
