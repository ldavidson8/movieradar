import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/blocs/moviegenres/movie_genres_cubit.dart';
import 'package:movieradar/models/movie_model.dart';
import 'package:movieradar/theme_constants.dart';
import 'package:movieradar/ui/widgets/custom_shimmer.dart';
import 'package:movieradar/utils/get_genre_names.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;

  const MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/movie/${movie.id}');
      },
      child: Row(
        children: [
          // Image
          SizedBox(
            width: 100,
            child: CachedNetworkImage(
              imageUrl: movie.posterPath!,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.width / 3,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const CustomShimmer(),
            ),
          ),
          const SizedBox(width: 16), // Spacing
          // Info Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  movie.title ?? movie.originalTitle ?? 'No Title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8), // Spacing
                // Rating
                Text('Rating: ${movie.voteAverage?.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 8), // Spacing
                // Genres
                BlocBuilder<MovieGenresCubit, MovieGenresState>(
                  builder: (context, genresState) {
                    if (genresState is MovieGenresLoaded) {
                      final genreNames =
                          getGenreNames(movie.genreIds, genresState.genres);
                      return Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: genreNames.map((name) {
                          return Chip(
                            label: Text(
                              name!,
                              style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColors.colorPrimaryLight
                                    : AppColors.darkPrimaryLight,
                              ),
                            ),
                            backgroundColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.colorPrimaryDark
                                    : AppColors.colorPrimaryDark,
                          );
                        }).toList(),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
