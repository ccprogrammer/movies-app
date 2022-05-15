import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';

import 'package:movies_app/pages/coming_soon/coming_soon_tab.dart';
import 'package:movies_app/pages/now_showing/now_showing_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            _buildSliverAppBar(),
          ],
          body: _buildTabBarView(),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Const.colorPrimary,
      elevation: 0,
      floating: true,
      snap: true,
      pinned: true,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        Const.appName,
        style: Const.textPrimary,
      ),
      bottom: PreferredSize(
        preferredSize: new Size(80.w, 80.h),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/icon_now_showing.png',
                      width: 24.w,
                    ),
                    Tab(text: 'Now Playing'),
                  ],
                ),
                Tab(text: 'Coming Soon'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: [
        NowPlaying(),
        ComingSoon(),
      ],
    );
  }
}
