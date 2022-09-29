import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/helper/helper.dart';
import 'package:movies_app/pages/view_all/recommendations_all.dart';
import 'package:movies_app/pages/view_all/similar_all.dart';
import 'package:movies_app/provider/movie_detail_provider.dart';
import 'package:movies_app/provider/recommendations_provider.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
import 'package:movies_app/widgets/cast_tile.dart';
import 'package:movies_app/widgets/expandable_text.dart';
import 'package:movies_app/widgets/loading/shimmer_card.dart';
import 'package:movies_app/widgets/loading/shimmer_overview.dart';
import 'package:movies_app/widgets/loading/shimmer_tile.dart';
import 'package:movies_app/widgets/recommendations_tile.dart';
import 'package:movies_app/widgets/similar_tile.dart';
import 'package:provider/provider.dart';

class DetailsTab extends StatefulWidget {
  const DetailsTab({Key? key}) : super(key: key);

  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 12.h),
        _buildSynopsis(),
        _buildSimilar(),
        _buildRecommendations(),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildSynopsis() {
    return Consumer<MovieDetailProvider>(builder: (context, data, child) {
      if (data.isLoading) return ShimmerOverview();

      return Container(
        margin: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Synopsis',
              style: Const.textPrimary.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            ExpandableText(
              '${data.movieDetail.synopsis}',
              trimLines: 4,
              style: Const.textSecondary,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildSimilar() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<SimilarMovieProvider>(
            builder: (context, data, child) {
              if (data.isLoading)
                return Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 18.w),
                        for (int i = 0; i < 5; i++) ShimmerCard(),
                      ],
                    ),
                  ),
                );
          if (data.similarMovie.isEmpty) return Container();
              return Column(
                children: [
                  _buildSectionTitle(
                      title: 'Similar Movies',
                      route: () {
                        helper(context)
                            .NavigateTo(destination: SimilarMoviesAll());
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 8.h),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 9.w.w),
                          for (var item in data.similarMovie)
                            SimilarCard(movie: item),
                          SizedBox(width: 9.w),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendations() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 6.h, 0.w, 0.w),
      child: Consumer<RecommendationsProvider>(
        builder: (context, data, child) {
          if (data.isLoading)
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < 5; i++) ShimmerTile(),
              ],
            );

          if (data.recommendationsMovie.isEmpty) return Container();

          return Column(
            children: [
              _buildSectionTitle(
                  title: 'Recommendations',
                  route: () {
                    helper(context)
                        .NavigateTo(destination: RecommendationsAll());
                  }),
              for (var item in data.recommendationsMovie)
                RecommendationsTile(movie: item),
            ],
          );
        },
      ),
    );
  }

  // Reuseable Widget
  Widget _buildSectionTitle({String? title, Function? route}) {
    return Container(
      margin: EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? 'Section Title',
            style: Const.textPrimary.copyWith(
              fontSize: 18.sp,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: StadiumBorder(),
              minimumSize: Size.zero,
              padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
            ),
            onPressed: () {
              route!();
            },
            child: Text(
              'View All',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: Const.medium,
                color: Const.colorBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Not Used
  Widget _buildCast() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            title: 'Cast & Crew',
          ),
          for (var i = 0; i < 3; i++) CastTile(),
        ],
      ),
    );
  }

  Widget _buildPhotos() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            title: 'Photos',
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 18),
                  for (var i = 0; i < 4; i++)
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                      width: 104.w,
                      height: 88.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(Const.dummyImage),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                        ),
                      ),
                    ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideos() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            title: 'Videos',
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 18),
                  for (var i = 0; i < 4; i++)
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                      width: 104.w,
                      height: 88.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(Const.dummyImage),
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                        ),
                      ),
                    ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
