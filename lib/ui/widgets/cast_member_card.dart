import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/custom_shimmer.dart';

class CastMemberCard extends StatelessWidget {
  const CastMemberCard({
    super.key,
    required this.name,
    required this.profilePath,
    this.character,
  });
  final String name;
  final String profilePath;
  final String? character;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: profilePath,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const CustomShimmer(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 4),
        Text(
          character != null ? 'As $character' : 'N/A',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
