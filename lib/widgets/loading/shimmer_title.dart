import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'skeleton.dart';

class ShimmerTitle extends StatelessWidget {
  const ShimmerTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          children: [
            Skeleton(
              height: 20,
              marginTop: 16,
              marginRight: 18,
              marginleft: 18,
              radius: 4,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Skeleton(
                    height: 20,
                    marginTop: 16,
                    marginleft: 18,
                    radius: 4,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Skeleton(
                    height: 20,
                    marginTop: 16,
                    marginRight: 6,
                    marginleft: 6,
                    radius: 4,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Skeleton(
                    height: 20,
                    marginTop: 16,
                    marginRight: 18,
                    marginleft: 0,
                    radius: 4,
                  ),
                ),
              ],
            ),
            Skeleton(
              width: double.infinity,
              height: 20,
              marginTop: 16,
              marginleft: 18,
              marginRight: 18,
              radius: 4,
            ),
            Skeleton(
              height: 20,
              marginTop: 16,
              marginRight: 18,
              marginleft: 18,
              radius: 4,
            ),
          ],
        ),
      ),
    );
  }
}
