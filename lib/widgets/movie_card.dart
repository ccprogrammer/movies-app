import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MovieDetailsPage()));
      },
      child: Container(
        padding: EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 250.h,
              width: 164.w,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJj8mi21whbhJRrCU09210xZBByEQOVDZNGw&usqp=CAU",
              placeholder: (context, url) => Container(
                height: 250.h,
                width: 164.w,
                child: Image.asset('assets/loader.gif'),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 16.h),
            RatingBar.builder(
              initialRating: 5,
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
              'John Wick 3',
              style: Const.textPrimary.copyWith(fontSize: 16.sp),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Text(
                  'Crime • 2hr 10m | R',
                  style: Const.textSecondary,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
