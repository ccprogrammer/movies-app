import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/pages/view_all/recommendations_all.dart';
import 'package:movies_app/pages/view_all/similar_all.dart';
import 'package:movies_app/pages/view_all/cast_all.dart';
import 'package:movies_app/pages/view_all/photos_all.dart';
import 'package:movies_app/provider/movie_detail_provider.dart';
import 'package:movies_app/provider/recommendations_provider.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
import 'package:movies_app/widgets/cast_tile.dart';
import 'package:movies_app/widgets/expandable_text.dart';
import 'package:movies_app/widgets/loading/shimmer_card.dart';
import 'package:movies_app/widgets/loading/shimmer_overview.dart';
import 'package:movies_app/widgets/loading/shimmer_tile.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class DetailsTab extends StatefulWidget {
  const DetailsTab({Key? key, this.movie}) : super(key: key);
  final MovieModel? movie;

  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
      if (data.isLoading) {
        return ShimmerOverview();
      } else {
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
                '${widget.movie!.synopsis}',
                trimLines: 4,
                style: Const.textSecondary,
              ),
            ],
          ),
        );
      }
    });
    // return ShimmerOverview();
  }

  Widget _buildCast() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
              title: 'Cast & Crew',
              route: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CastCrew()))),
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
              route: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Photos()))),
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

  Widget _buildSimilar() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
              title: 'Similar Movies',
              route: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SimilarMoviesAll()));
              }),
          SizedBox(height: 8.h),
          _buildHorizontalSimilar(),
        ],
      ),
    );
  }

  Widget _buildHorizontalSimilar() {
    return Consumer<SimilarMovieProvider>(
      builder: (context, data, child) {
        if (data.isLoading) {
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
        } else {
          return Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 18.w),
                  for (var item in data.similarMovie)
                    OpenContainer(
                      closedColor: Const.colorPrimary,
                      openColor: Const.colorPrimary,
                      closedElevation: 0,
                      closedBuilder: (context, action) {
                        return InkWell(
                          onTap: () async {
                            await Provider.of<MovieDetailProvider>(context,
                                    listen: false)
                                .getMovieDetail(movieId: item.id);
                            action();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20.w),
                            width: 160.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        item.poster ?? Const.dummyImage,
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.3),
                                          BlendMode.darken),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 12.h, 0, 0),
                                  child: Text(
                                    item.title ?? '',
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
                                    item.synopsis ?? '',
                                    style: Const.textSecondary,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      openBuilder: (context, action) {
                        return MovieDetailsPage(
                          movieId: item.id,
                        );
                      },
                    ),
                  SizedBox(width: 4),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildRecommendations() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 14.h, 0.w, 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
              title: 'Recommendations',
              route: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecommendationsAll()));
              }),
          _buildVerticalRecommendations(),
        ],
      ),
    );
  }

  Widget _buildVerticalRecommendations() {
    return Consumer<RecommendationsProvider>(
      builder: (context, data, child) {
        if (data.isLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < 5; i++) ShimmerTile(),
            ],
          );
        } else {
          return Column(
            children: [
              for (var item in data.recommendationsMovie)
                OpenContainer(
                  closedColor: Const.colorPrimary,
                  openColor: Const.colorPrimary,
                  closedElevation: 0,
                  closedBuilder: (context, action) {
                    return InkWell(
                      onTap: () async {
                        await Provider.of<MovieDetailProvider>(context,
                                listen: false)
                            .getMovieDetail(movieId: item.id);
                        action();
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(18.w, 18.h, 24.w, 18.h),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.network(
                                    item.poster ??
                                        'https://images.unsplash.com/photo-1549877452-9c387954fbc2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGxhY2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                    width: 84.w,
                                    height: 84.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // nama
                                      Text(
                                        item.title ?? '',
                                        style: Const.textPrimary.copyWith(
                                          fontSize: 14,
                                          fontWeight: Const.medium,
                                        ),
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: 4.h),

                                      Text(
                                        item.synopsis ?? '',
                                        style: Const.textSecondary
                                            .copyWith(fontSize: 12),
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
                                              'Launch ${item.releaseDate}',
                                              style: Const.textReleaseDate
                                                  .copyWith(fontSize: 12),
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
                                          text: (item.rating! / 2)
                                              .toStringAsFixed(0),
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
                  },
                  openBuilder: (context, action) {
                    return MovieDetailsPage(
                      movieId: item.id,
                    );
                  },
                ),
            ],
          );
        }
      },
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
}
