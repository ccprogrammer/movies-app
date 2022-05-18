import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/widgets/expandable_text.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ViewAllCard extends StatelessWidget {
  const ViewAllCard({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsPage(
                movieId: data.id,
              ),
            ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 0), // changes position of shadow
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  height: 168.h,
                  width: double.infinity.w,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  imageUrl: data.poster.toString(),
                  placeholder: (context, url) => Shimmer.fromColors(
                      child: Skeleton(
                        height: 168.h,
                        width: double.infinity,
                      ),
                      baseColor: Colors.grey[500]!,
                      highlightColor: Colors.grey[300]!),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18.h, 14.w, 18.h, 0),
              child: Text(
                data.title ?? '',
                style: Const.textPrimary.copyWith(fontSize: 16.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18.w, 6.h, 18.w, 0),
              child: ExpandableText(
                '${data.synopsis}',
                style: Const.textSecondary,
                trimLines: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
