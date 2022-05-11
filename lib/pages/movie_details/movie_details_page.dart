import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'dart:ui';

import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/movie_details/details_tab.dart';
import 'package:movies_app/pages/movie_details/reviews_tab.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key, this.url}) : super(key: key);
  final String? url;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage>
    with SingleTickerProviderStateMixin {
  double rating = 0.0;
  ScrollController scrollController = ScrollController();
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
      expandedHeight: 600.h,
      backgroundColor: Const.colorPrimary,
      elevation: 0,
      floating: false,
      snap: false,
      pinned: false,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10.w, 12.h, 18.w, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(Const.dummyImage),
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
                image: NetworkImage(widget.url.toString()),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(18.w, 149.h, 18.w, 0),
      child: Column(
        children: [
          Text(
            'John Wick 3: Parabellum',
            style: Const.textPrimary,
          ),
          SizedBox(height: 16.h),
          Text(
            '2hr 10m | R',
            style: Const.textSecondary,
          ),
          SizedBox(height: 9.h),
          Text(
            'Action, Crime, Thriller',
            style: Const.textSecondary,
          ),
          SizedBox(height: 29.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '4.6/5',
                style: Const.textPrimary,
              ),
              SizedBox(width: 8.w),
              RatingBar.builder(
                initialRating: 5,
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
    return TabBarView(
      children: [
        DetailsTab(),
        ReviewsTab(),
        DetailsTab(),
      ],
    );
  }
}
