import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/ui/widgets/custom_shimmer.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key, required this.id, required this.posterPath, this.title});

  final int id;
  final String posterPath;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/movie/$id');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: posterPath,
              fit: BoxFit.cover,
              height: 200,
              width: 150,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const CustomShimmer(),
            ),
          ),
          if (title != null) ...[
            SizedBox(height: 8),
            AutoSizeText(
              title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
