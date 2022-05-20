import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'dart:ui';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/pages/movie_details/details_tab.dart';
import 'package:movies_app/pages/movie_details/reviews_tab.dart';
import 'package:movies_app/provider/favorite_provider.dart';
import 'package:movies_app/provider/movie_detail_provider.dart';
import 'package:movies_app/provider/recommendations_provider.dart';
import 'package:movies_app/provider/reviews_provider.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Const.colorPrimary,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            _buildSliverAppBar(),
          ],
          body: _buildTabView(),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      titleSpacing: 18.w,
      expandedHeight: 635.h,
      backgroundColor: Const.colorPrimary,
      elevation: 0,
      floating: false,
      snap: false,
      pinned: false,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeaders(),
            _buildTitle(),
            SizedBox(height: 10.h),
            _buildTabBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaders() {
    return Consumer<MovieDetailProvider>(
      builder: (context, data, child) {
        if (data.isLoading) return ShimmerHeaders();

        return Stack(
          clipBehavior: Clip.none,
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
              height: 260.h,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: SafeArea(
                  child: Container(
                    alignment: Alignment.topCenter,
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
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    duration: Duration(milliseconds: 1000),
                                    backgroundColor: Const.colorBlue,
                                    content: Text(
                                      'Movie has been added to favorites',
                                      textAlign: TextAlign.center,
                                    ),
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(milliseconds: 1000),
                                      backgroundColor: Const.colorSplashScreen,
                                      content: Text(
                                        'Movie has been removed from favorites',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color:
                                      add.isFavorite(data.movieDetail) == false
                                          ? Const.colorFavorite
                                          : Const.colorBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/icon_save.png',
                                    width: 18.w,
                                    height: 18.h,
                                    color: add.isFavorite(data.movieDetail) ==
                                            false
                                        ? Const.colorPrimary
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 125.h,
              right: 0,
              left: 0,
              child: Container(
                margin: EdgeInsets.fromLTRB(105, 0, 105, 0),
                width: 164.w,
                height: 250.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.movieDetail.poster!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTitle() {
    return Consumer<MovieDetailProvider>(
      builder: (context, data, child) {
        if (data.isLoading == true) return ShimmerTitle();

        return Container(
          margin: EdgeInsets.fromLTRB(18.w, 149.h, 18.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data.movieDetail.title ?? '',
                textAlign: TextAlign.center,
                style: Const.textPrimary,
              ),
              SizedBox(height: 16.h),
              _buildGenre(),
              SizedBox(height: 12.h),
              Text(
                'Release Date',
                style: Const.textSecondary.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                data.movieDetail.releaseDate ?? 'TBA',
                style: Const.textReleaseDate.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
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
          if (data.isLoading) return ShimmerTabBar();

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

  Widget _buildTabView() {
    return TabBarView(
      children: [
        DetailsTab(),
        ReviewsTab(),
      ],
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
}
