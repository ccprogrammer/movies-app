import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/similar_model.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class SimilarCard extends StatelessWidget {
  const SimilarCard({Key? key, required this.movie}) : super(key: key);
  final SimilarMovieModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsPage(
                movieId: movie.id,
              ),
            ));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(9.w, 6.h, 9.w, 6.h),
        width: 170.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: 240.h,
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
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 12.h, 0, 0),
              child: Text(
                movie.title ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Const.textPrimary.copyWith(
                  fontWeight: Const.medium,
                  fontSize: 14.sp,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 4.h, 0, 0),
              child: Text(
                movie.synopsis ?? '',
                style: Const.textSecondary,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
