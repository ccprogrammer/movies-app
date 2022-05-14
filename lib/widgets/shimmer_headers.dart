import 'package:flutter/material.dart';

import 'skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHeaders extends StatelessWidget {
  const ShimmerHeaders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[500]!,
          highlightColor: Colors.grey[300]!,
          child: Skeleton(
            width: double.infinity,
            height: 260,
          ),
        ),
        Positioned(
          top: 125,
          left: 110,
          right: 110,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[300]!,
            child: Skeleton(
              height: 240,
            ),
          ),
        ),
      ],
    );
  }
}
