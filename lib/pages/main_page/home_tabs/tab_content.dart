import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/widgets/movie_card.dart';

// This widget used in home_tabs tab
class TabContent extends StatelessWidget {
  const TabContent({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 24.h, 0, 68.h),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 16.w / 35.h,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: data[index],
          );
        },
      ),
    );
  }
}
