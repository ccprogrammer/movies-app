import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'dart:ui';

import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/movie_details/details_tab.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage>
    with SingleTickerProviderStateMixin {
  double rating = 0.0;

  ScrollController scrollController = ScrollController();

  late TabController _tabBarController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabBarController = TabController(length: 3, vsync: this);
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabBarController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      body: ListView(
        children: [
          _buildHeaders(),
          _buildTitle(),
          _buildTabBar(),
        ],
      ),
    );
  }

  Widget _buildHeaders() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(18.w, 12.h, 18.w, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(Const.dummyImage),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          height: 240.h,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    size: 34,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icon_share.png',
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -125.h,
          right: 0,
          left: 0,
          child: Image.network(
            Const.dummyImage,
            width: 164.w,
            height: 250.h,
          ),
        )
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

  Widget _buildTabBar() {
    return Column(
      children: [
        Container(
          height: 48.h,
          margin: EdgeInsets.fromLTRB(18.w, 50.h, 18.w, 0),
          padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: Const.colorIndicatorBorder),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: TabBar(
            controller: _tabBarController,
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
        Container(
          height: MediaQuery.of(context).size.height * 1.4,
          child: TabBarView(
            controller: _tabBarController,
            children: [
              DetailsTab(controller: scrollController),
              DetailsTab(controller: scrollController),
              DetailsTab(controller: scrollController),
            ],
          ),
        ),
      ],
    );
  }
}
