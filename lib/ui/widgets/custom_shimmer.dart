import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 500,
        child: Shimmer.fromColors(
            child: Container(
              color: Colors.white,
            ),
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!));
  }
}
