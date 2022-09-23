import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'dart:ui';
import 'package:movies_app/constants.dart';
import 'package:movies_app/helper/helper.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/pages/main_page/main_page.dart';
import 'package:movies_app/pages/movie_details/details_tab.dart';
import 'package:movies_app/pages/movie_details/reviews_tab.dart';
import 'package:movies_app/provider/favorite_provider.dart';
import 'package:movies_app/provider/movie_detail_provider.dart';
import 'package:movies_app/provider/recommendations_provider.dart';
import 'package:movies_app/provider/reviews_provider.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
import 'package:movies_app/widgets/loading/loading_screen.dart';
import 'package:movies_app/widgets/loading/shimmer_headers.dart';
import 'package:movies_app/widgets/loading/shimmer_tabbar.dart';
import 'package:movies_app/widgets/loading/shimmer_title.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key, required this.movieId}) : super(key: key);
  final int? movieId;
  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage>
    with SingleTickerProviderStateMixin {
  double rating = 0.0;
  late TabController _tabController;

  bool favorite = false;

  getData() {
    Provider.of<MovieDetailProvider>(context, listen: false)
        .getMovieDetail(movieId: widget.movieId);
    Provider.of<SimilarMovieProvider>(context, listen: false)
        .getSimilarMovie(widget.movieId);
    Provider.of<RecommendationsProvider>(context, listen: false)
        .getRecommendationsMovie(widget.movieId);
    Provider.of<ReviewsProvider>(context, listen: false)
        .getReviews(widget.movieId);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Const.colorPrimary,
        body: SafeArea(
          child: Consumer<MovieDetailProvider>(
              builder: (context, movieDetail, child) {
            if (movieDetail.isLoading) return LoadingScreen();
            return NestedScrollView(
              headerSliverBuilder: (context, v) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            _buildHeaderImage(),
                            _buildHeaderContent(),
                          ],
                        ),
                        _buildTabBar(),
                      ],
                    ),
                  ),
                ];
              },
              body: _buildContent(),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    double width = MediaQuery.of(context).size.width;

    return Consumer<MovieDetailProvider>(
      builder: (context, data, child) {
        if (data.isLoading) return SizedBox();

        return Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10.w, 12.h, 18.w, 0),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data.movieDetail.poster!),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              height: 300.h,
            ),
            Positioned(
              bottom: -5,
              child: Container(
                height: 100,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Const.colorPrimary,
                      Colors.transparent,
                    ],
                    stops: [0.1, 1.0],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeaderContent() {
    return Consumer<MovieDetailProvider>(
      builder: (context, data, child) {
        if (data.isLoading) return SizedBox();

        return Container(
          margin: EdgeInsets.fromLTRB(18.w, 0.h, 18.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // back and add favorite button
              Container(
                margin: EdgeInsets.only(top: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // leading back icon button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 32.w,
                      ),
                    ),

                    // favorite icon button
                    Consumer<FavoriteProvider>(
                      builder: (context, add, child) {
                        return GestureDetector(
                          onTap: () {
                            add.setFavorite(data.movieDetail);

                            if (add.isFavorite(data.movieDetail) == true) {
                              helper(context).SnackBarCommon(
                                text: 'Movie has been added to favorites',
                                color: Const.colorBlue,
                              );
                            } else {
                              helper(context).SnackBarCommon(
                                text: 'Movie has been removed from favorites',
                                color: Const.colorSplashScreen,
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                                color: add.isFavorite(data.movieDetail) == true
                                    ? Const.colorBlue
                                    : Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(
                                      1.0,
                                      1.0,
                                    ),
                                  )
                                ]),
                            child: add.isFavorite(data.movieDetail) == false
                                ? Icon(Icons.favorite,
                                    color: Const.colorPrimary)
                                : Icon(Icons.favorite, color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // movie image
              Container(
                margin: EdgeInsets.only(top: 51.h),
                width: 164.w,
                height: 250.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.movieDetail.poster!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // movie title
              Container(
                margin: EdgeInsets.only(top: 32.h),
                child: Text(
                  data.movieDetail.title ?? '',
                  textAlign: TextAlign.center,
                  style: Const.textPrimary,
                ),
              ),

              // movie genre
              Container(
                margin: EdgeInsets.only(top: 16.h),
                child: _buildGenre(),
              ),

              // movie release date
              Container(
                margin: EdgeInsets.only(top: 12.h),
                child: Text(
                  'Release Date',
                  style: Const.textSecondary.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 6.h),
                child: Text(
                  data.movieDetail.releaseDate ?? 'TBA',
                  style: Const.textReleaseDate.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),

              // movie rating
              Container(
                margin: EdgeInsets.only(top: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${(data.movieDetail.rating! / 2).toStringAsFixed(0)}/5',
                      style: Const.textPrimary,
                    ),
                    SizedBox(width: 8.w),
                    RatingBar.builder(
                      initialRating: data.movieDetail.rating != null
                          ? data.movieDetail.rating! / 2
                          : 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      glow: false,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                      ignoreGestures: true,
                      itemSize: 20.w,
                      itemBuilder: (context, _) => Image.asset(
                        'assets/icon_star.png',
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {
                        this.rating = rating;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildTabBar() {
    return PreferredSize(
      preferredSize: Size(80.0.w, 80.0.h),
      child: Consumer<MovieDetailProvider>(
        builder: (context, data, child) {
          if (data.isLoading)
            return SizedBox(
              height: 38,
            );

          return Container(
            color: Const.colorPrimary,
            padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 16.h),
            child: Container(
              height: 48.h,
              margin: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
              padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
              decoration: BoxDecoration(
                border: Border.all(color: Const.colorIndicatorBorder),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Const.colorIndicator,
                ),
                labelStyle: Const.textPrimary.copyWith(fontSize: 14.sp),
                tabs: [
                  Tab(text: 'Detail'),
                  Tab(text: 'Reviews'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGenre() {
    MovieModel movie = Provider.of<MovieDetailProvider>(context).movieDetail;

    return Container(
      margin: EdgeInsets.fromLTRB(68, 0, 68, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                for (var i = 0; i < movie.genre!.length; i++)
                  Text(
                    movie.genre![i].name == movie.genre!.last.name
                        ? '${movie.genre![i].name} '
                        : '${movie.genre![i].name}, ',
                    style: Const.textSecondary,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        DetailsTab(),
        ReviewsTab(),
      ],
    );
  }
}
