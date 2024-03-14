import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/ui/widgets/custom_shimmer.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.overview,
    required this.rating,
  });

  final int id;
  final String image;
  final String title;
  final String overview;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/movie/$id');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 500,
                placeholder: (context, url) => const CustomShimmer(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          AutoSizeText(
            title,
            maxLines: 2,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text((rating).toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodyMedium),
              const Icon(Icons.star, color: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}
