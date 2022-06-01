import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movies_app/widgets/movie_card.dart';

// This widget used in home_tabs tab

class TabContent extends StatelessWidget {
  const TabContent({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.fromLTRB(10.w, 24.h, 10.w, 0),
      crossAxisCount: 4,
      itemCount: data.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return MovieCard(
          movie: data[index],
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 4),
      mainAxisSpacing: 20.0.h,
      crossAxisSpacing: 12.0.w,
    );
  }
}
