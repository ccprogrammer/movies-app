import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/recommendations_model.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationsTile extends StatelessWidget {
  const RecommendationsTile({Key? key, required this.movie}) : super(key: key);
  final RecommendationsModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsPage(
                movieId: movie.id,
              ),
            ));
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(18.w, 18.h, 24.w, 18.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: 84.w,
                    height: 84.h,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                    imageUrl: movie.poster.toString(),
                    placeholder: (context, url) => Shimmer.fromColors(
                        child: Skeleton(),
                        baseColor: Colors.grey[500]!,
                        highlightColor: Colors.grey[300]!),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // nama
                      Text(
                        movie.title ?? '',
                        style: Const.textPrimary.copyWith(
                          fontSize: 14,
                          fontWeight: Const.medium,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 4.h),

                      Text(
                        movie.synopsis ?? '',
                        style: Const.textSecondary.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              movie.releaseDate ?? '',
                              style:
                                  Const.textReleaseDate.copyWith(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 62.w),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 18,
            child: Container(
              padding: EdgeInsets.fromLTRB(6.w, 4.h, 6.w, 4.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon_star.png',
                    width: 18.w,
                    height: 18.h,
                  ),
                  SizedBox(width: 4.w),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: (movie.rating! / 2).toStringAsFixed(0),
                          style: Const.textSecondary.copyWith(
                            color: Const.colorBlue,
                            fontSize: 14.sp,
                            fontWeight: Const.bold,
                          ),
                        ),
                        TextSpan(
                          text: '/5',
                          style: Const.textSecondary.copyWith(
                            color: Const.colorBlue,
                            fontSize: 12.sp,
                            fontWeight: Const.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
