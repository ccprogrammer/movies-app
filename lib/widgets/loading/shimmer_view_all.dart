import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerViewAll extends StatelessWidget {
  const ShimmerViewAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[500]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(18, 24, 18, 0),
                    child: Column(
                      children: [
                        Skeleton(
                          height: 168.h,
                          width: double.infinity,
                          radius: 4.r,
                        ),
                        for (var i = 0; i < 2; i++)
                          Skeleton(
                            width: double.infinity,
                            height: 20.h,
                            marginTop: 8.h,
                            radius: 4.r,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
