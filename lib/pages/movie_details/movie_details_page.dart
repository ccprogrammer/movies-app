import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'dart:ui';

import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/now_playing_model.dart';

import 'package:movies_app/pages/movie_details/details_tab.dart';
import 'package:movies_app/pages/movie_details/reviews_tab.dart';
import 'package:movies_app/provider/movie_detail_provider.dart';
import 'package:movies_app/provider/recommendations_provider.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
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

  getSimilar() {
    Provider.of<SimilarMovieProvider>(context, listen: false)
        .getSimilarMovie(widget.movieId);
  }

  getRecommendations() {
    Provider.of<RecommendationsProvider>(context, listen: false)
        .getRecommendationsMovie(widget.movieId);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    getSimilar();
    getRecommendations();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
      expandedHeight: 625.h,
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
    MovieModel movie = Provider.of<MovieDetailProvider>(context).movieDetail;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10.w, 12.h, 18.w, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(movie.poster!),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icon_share.png',
                        width: 24.w,
                        height: 24.h,
                      ),
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
                image: NetworkImage(movie.poster!),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    MovieModel movie = Provider.of<MovieDetailProvider>(context).movieDetail;
    return Container(
      margin: EdgeInsets.fromLTRB(18.w, 149.h, 18.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${movie.title}',
            textAlign: TextAlign.center,
            style: Const.textPrimary,
          ),
          SizedBox(height: 16.h),
          _buildGenre(),
          SizedBox(height: 9.h),
          Text(
            'Release Date',
            style: Const.textReleaseDate.copyWith(fontSize: 14),
          ),
          SizedBox(height: 4.h),
          Text(
            movie.releaseDate ?? '',
            style: Const.textSecondary.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(movie.rating! / 2).toStringAsFixed(0)}/5',
                style: Const.textPrimary,
              ),
              SizedBox(width: 8.w),
              RatingBar.builder(
                initialRating: movie.rating! / 2,
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
  }

  PreferredSizeWidget _buildTabBar() {
    return PreferredSize(
      preferredSize: Size(80.0.w, 80.0.h),
      child: Container(
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
              Tab(text: 'Showtime'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabView() {
    MovieModel movie = Provider.of<MovieDetailProvider>(context).movieDetail;

    return TabBarView(
      children: [
        DetailsTab(
          movie: movie,
        ),
        ReviewsTab(),
        DetailsTab(),
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
