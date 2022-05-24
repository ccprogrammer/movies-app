import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/home_movie_model.dart';
import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:movies_app/widgets/loading/refresher.dart';
import 'package:movies_app/widgets/loading/shimmer_home_movie.dart';
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
    return Consumer<NowPlayingProvider>(
      builder: (context, data, child) {
        if (data.isLoading == true) return _buildIsLoading();
        return _buildMovies(data: data.nowPlaying);
      },
    );
  }

  Widget _buildIsLoading() {
    return GridView.builder(
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
    );
  }

  Widget _buildMovies({required List<HomeMovieModel> data}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 24.h, 0, 68.h),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
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
