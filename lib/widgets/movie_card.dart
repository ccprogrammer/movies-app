import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:shimmer/shimmer.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final MovieModel movie;
  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Const.colorPrimary,
      openColor: Const.colorPrimary,
      closedElevation: 0,
      closedBuilder: (context, action) {
        return InkWell(
          onTap: () {
            action();
            print(widget.movie.rating);
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
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[500]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    color: Colors.grey,
                    height: 250.h,
                    width: 164.w,
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
                onRatingUpdate: (double value) {
                  this.rating = rating;
                },
              ),
              SizedBox(height: 7.h),
              Text(
                '${widget.movie.title}',
                style: Const.textPrimary.copyWith(fontSize: 16.sp),
                maxLines: 2,
              ),
              SizedBox(height: 4.h),
              // Text(
              //   'Crime • 2hr 10m | R',
              //   style: Const.textSecondary,
              //   maxLines: 1,
              // ),
            ],
          ),
        );
      },
      openBuilder: (context, action) {
        return MovieDetailsPage(
          movie: widget.movie,
        );
      },
    );
  }
}
