import 'package:flutter/material.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTabBar extends StatelessWidget {
  const ShimmerTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[300]!,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Skeleton(
              height: 28,
              marginleft: 18,
              marginRight: 6,
              marginBottom: 38,
              radius: 4,
            ),
          ),
          Expanded(
            flex: 1,
            child: Skeleton(
              height: 28,
              marginBottom: 38,
              radius: 4,
            ),
          ),
          Expanded(
            flex: 1,
            child: Skeleton(
              height: 28,
              marginleft: 6,
              marginRight: 18,
              marginBottom: 38,
              radius: 4,
            ),
          ),
        ],
      ),
    );
  }
}
