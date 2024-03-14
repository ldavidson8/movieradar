import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/data/database_helper.dart';
import 'package:movieradar/models/movie_details.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({super.key, required this.movie});
  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.go('/');
          },
          child: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () async {
            final dbHelper = DatabaseHelper.instance;
            await dbHelper.addFavouriteMovie(movie);
          },
          child: const Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
