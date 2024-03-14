import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/models/movie_details.dart';
import 'dart:developer' as dev;

class MovieDetailAppBar extends StatefulWidget {
  const MovieDetailAppBar({
    super.key,
    required this.movie,
    required this.isFavourite,
    required this.onFavouritePressed,
  });

  final MovieDetails movie;
  final bool isFavourite;
  final VoidCallback onFavouritePressed;

  @override
  _MovieDetailAppBarState createState() => _MovieDetailAppBarState();
}

class _MovieDetailAppBarState extends State<MovieDetailAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant MovieDetailAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFavourite != oldWidget.isFavourite) {
      if (widget.isFavourite) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.go('/');
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(
              8,
            ),
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onFavouritePressed();
            dev.log('isFavourite after tap: ${widget.isFavourite}');
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Icon(
                  widget.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: Color.lerp(Colors.white, Colors.red, _animation.value),
                  size: 30,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
