import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/helper/helper.dart';
import 'package:movies_app/models/home_movie_model.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final HomeMovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Const.colorPrimary,
      child: InkWell(
        onTap: () {
          helper(context).NavigateTo(
            destination: MovieDetailsPage(
              movieId: movie.id!,
            ),
          );
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: CachedNetworkImage(
                height: 250.h,
                width: double.infinity,
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                imageUrl: movie.poster.toString(),
                placeholder: (context, url) => Shimmer.fromColors(
                    child: Skeleton(),
                    baseColor: Colors.grey[500]!,
                    highlightColor: Colors.grey[300]!),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  RatingBar.builder(
                    initialRating: movie.rating != null ? movie.rating! / 2 : 0,
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
                    movie.title ?? '',
                    style: Const.textPrimary.copyWith(fontSize: 16.sp),
                    maxLines: 2,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    movie.releaseDate ?? '',
                    style: Const.textReleaseDate,
                  )
                  // _buildGenre(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildGenre() {
  //   return Container(
  //     child: Wrap(
  //       children: [
  //         for (var i = 0; i < movie.genre!.length; i++)
  //           Text(
  //             movie.genre![i].name == movie.genre!.last.name
  //                 ? '${movie.genre![i].name} '
  //                 : '${movie.genre![i].name}, ',
  //             maxLines: 1,
  //             style: Const.textSecondary,
  //           ),
  //       ],
  //     ),
  //   );
  // }

}
