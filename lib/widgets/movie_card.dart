import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/now_playing_model.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/provider/movie_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final NowPlayingModel movie;
  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsPage(
                movieId: widget.movie.id!,
              ),
            ));
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: widget.movie.poster.toString(),
            imageBuilder: (context, _) {
              return Image.network(
                widget.movie.poster.toString(),
                height: 250.h,
                width: 164.w,
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              );
            },
            placeholder: (context, url) => Container(
              height: 250.h,
              width: 164.w,
              child: Center(
                child: CircularProgressIndicator(
                  color: Const.colorBlue,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 16.h),
          RatingBar.builder(
            initialRating: widget.movie.rating! / 2,
            minRating: 0,
            direction: Axis.horizontal,
            glow: false,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            ignoreGestures: true,
            itemSize: 14,
            itemBuilder: (context, _) => Image.asset(
              'assets/icon_star.png',
              color: Colors.amber,
            ),
            onRatingUpdate: (double value) {},
          ),
          SizedBox(height: 7.h),
          Text(
            '${widget.movie.title}',
            style: Const.textPrimary.copyWith(fontSize: 16.sp),
            maxLines: 2,
          ),
          SizedBox(height: 4.h),
          // _buildGenre(),
        ],
      ),
    );
  }

  // Widget _buildGenre() {
  //   return Container(
  //     child: Wrap(
  //       children: [
  //         for (var i = 0; i < widget.movie.genre!.length; i++)
  //           Text(
  //             widget.movie.genre![i].name == widget.movie.genre!.last.name
  //                 ? '${widget.movie.genre![i].name} '
  //                 : '${widget.movie.genre![i].name}, ',
  //             maxLines: 1,
  //             style: Const.textSecondary,
  //           ),
  //       ],
  //     ),
  //   );
  // }

}
