import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:movies_app/widgets/loading/shimmer_now_playing.dart';
import 'package:movies_app/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      body: Container(
        padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 24.h),
            _buildMoviesGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildMoviesGrid() {
    return Consumer<NowPlayingProvider>(
      builder: (context, data, child) {
        if (data.isLoading) {
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
              return ShimmerNowPlaying();
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
            itemCount: data.nowPlaying.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: data.nowPlaying[index],
              );
            },
          );
        }
      },
    );
  }
}
