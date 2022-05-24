import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/main_page/tabs/now_playing/now_playing_tab.dart';
import 'package:movies_app/pages/main_page/tabs/tabbar_page.dart';
import 'package:movies_app/pages/main_page/tabs/popular/popular_tab.dart';
import 'package:movies_app/pages/main_page/tabs/upcoming/upcoming_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            _buildSliverAppBar(),
          ],
          body: TabBarView(
            children: [
              TabBarPage(
                child: NowPlaying(),
              ),
              TabBarPage(
                child: Upcoming(),
              ),
              TabBarPage(
                child: Popular(),
              ),
            ],
          ),
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
                Tab(text: 'Now Playing'),
                Tab(text: 'Upcoming'),
                Tab(text: 'Popular'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
