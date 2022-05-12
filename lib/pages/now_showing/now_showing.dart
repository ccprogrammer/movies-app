import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';

import 'package:movies_app/provider/now_playing_provider.dart';
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
    var nowPlayingProvider = Provider.of<NowPlayingProvider>(context);

    return Scaffold(
      backgroundColor: Const.colorPrimary,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(nowPlayingProvider.nowPlaying);
        },
        child: Icon(Icons.print),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 24.h),
            GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 16.w / 35.h,
              ),
              primary: false,
              shrinkWrap: true,
              itemCount: nowPlayingProvider.nowPlaying.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: nowPlayingProvider.nowPlaying[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
