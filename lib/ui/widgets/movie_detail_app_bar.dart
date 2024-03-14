import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({Key? key}) : super(key: key);

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
        const Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: 30,
        )
      ],
    );
  }
}
