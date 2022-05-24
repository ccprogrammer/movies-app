import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/widgets/loading/shimmer_home_movie.dart';

class TabLoading extends StatelessWidget {
  const TabLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 24.h, 0, 68.h),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 0.h,
          childAspectRatio: 16.w / 35.h,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShimmerHomeMovies();
        },
      ),
    );
  }
}
