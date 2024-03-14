import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/models/movie_details.dart';
import 'package:movieradar/ui/widgets/custom_shimmer.dart';
import 'package:movieradar/ui/widgets/movie_detail_app_bar.dart';

class MovieDetailPoster extends StatelessWidget {
  const MovieDetailPoster({
    super.key,
    required this.movie,
    required this.onFavouritePressed,
  });
  final MovieDetails movie;
  final bool isFavourite = false;
  final VoidCallback onFavouritePressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: movie.posterPath ?? 'assets/images/placeholder.png',
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => const CustomShimmer(),
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          top: 55,
          child: MovieDetailAppBar(
            movie: movie,
            isFavourite: isFavourite,
            onFavouritePressed: () => onFavouritePressed(),
          ),
        ),
      ],
    );
  }
}
