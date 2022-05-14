import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';

import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:movies_app/widgets/movie_card.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  Widget build(BuildContext context) {
    var nowPlayingProvider = Provider.of<NowPlayingProvider>(context);

    return Scaffold(
      backgroundColor: Const.colorPrimary,
      body: Container(
        padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 24.h),
            _buildMoviesGrid(data: nowPlayingProvider.nowPlaying),
          ],
        ),
      ),
    );
  }

  Widget _buildMoviesGrid({data}) {
    if (data.isEmpty) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 0.h,
          childAspectRatio: 16.w / 33.h,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[400]!,
            child: Column(
              children: [
                Container(
                  height: 230.h,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                for (var i = 0; i < 3; i++)
                  Container(
                    margin: EdgeInsets.only(top: 8.h),
                    height: 16.h,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
              ],
            ),
          );
        },
      );
    } else {
      return GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 16.w / 33.h,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: data[index],
          );
        },
      );
    }
  }
}
