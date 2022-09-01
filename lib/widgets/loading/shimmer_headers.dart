import 'package:flutter/material.dart';

import 'skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHeaders extends StatelessWidget {
  const ShimmerHeaders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[300]!,
      child: Skeleton(
        width: double.infinity,
        height: 260,
      ),
    );
  }
}
