import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
import 'package:movies_app/widgets/cast_tile.dart';
import 'package:movies_app/widgets/expandable_text.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SimilarMoviesAll extends StatefulWidget {
  const SimilarMoviesAll({Key? key}) : super(key: key);

  @override
  State<SimilarMoviesAll> createState() => _SimilarMoviesAllState();
}

class _SimilarMoviesAllState extends State<SimilarMoviesAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      appBar: _buildAppBar(),
      body: _buildSimilarList(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Const.colorPrimary,
      elevation: 1,
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left,
          size: 32.w,
        ),
      ),
      title: Text(
        'Similar Movies',
        style: Const.textPrimary.copyWith(
          fontSize: 18.sp,
          fontWeight: Const.semiBold,
        ),
      ),
      bottom: PreferredSize(
          child: Container(
            color: Const.colorIndicatorBorder,
            height: 1.0.h,
          ),
          preferredSize: Size.fromHeight(4.0.h)),
    );
  }

  Widget _buildSimilarList() {
    return Consumer<SimilarMovieProvider>(
      builder: (context, data, child) {
        if (data.isLoading) {
          return ListView(
            children: [
              SizedBox(height: 10.h),
              for (var i = 0; i < 4; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[500]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(18, 24, 18, 0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.grey,
                              ),
                              height: 168.h,
                              width: double.infinity,
                            ),
                            for (var i = 0; i < 2; i++)
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                height: 16.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          );
        } else {
          return ListView(
            children: [
              for (var item in data.similarMovie)
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(
                            movieId: item.id,
                          ),
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
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
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            )
                          ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: CachedNetworkImage(
                              height: 168.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              imageUrl: item.poster.toString(),
                              placeholder: (context, url) => Shimmer.fromColors(
                                  child: Skeleton(),
                                  baseColor: Colors.grey[500]!,
                                  highlightColor: Colors.grey[300]!),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(18.w, 14.h, 18.w, 0),
                          child: Text(
                            item.title ?? '',
                            style: Const.textPrimary.copyWith(fontSize: 16.sp),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(18.w, 6.h, 18.w, 0),
                          child: ExpandableText(
                            '${item.synopsis}',
                            style: Const.textSecondary,
                            trimLines: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}
