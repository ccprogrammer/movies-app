import 'package:flutter/material.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomeMovies extends StatelessWidget {
  const ShimmerHomeMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[300]!,
      child: Column(
        children: [
          Skeleton(
            height: 210,
            radius: 4,
          ),
          Skeleton(
            height: 20,
            marginTop: 8,
            radius: 4,
          ),
          Skeleton(
            height: 20,
            marginTop: 8,
            radius: 4,
          ),
        ],
      ),
    );
  }
}
