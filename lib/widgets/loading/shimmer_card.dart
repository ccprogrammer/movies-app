import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'skeleton.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 18, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Skeleton(
              height: 100,
              width: 160,
              radius: 4,
            ),
            SizedBox(height: 10),
            Skeleton(
              height: 12,
              width: 160,
              radius: 2,
            ),
            SizedBox(height: 6),
            Skeleton(
              height: 12,
              width: 160,
              radius: 2,
            ),
          ],
        ),
      ),
    );
  }
}
