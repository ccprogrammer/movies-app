import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/coming_soon/coming_soon.dart';
import 'package:movies_app/pages/now_showing/now_showing.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            _buildSliverAppBar(),
          ],
          body: TabBarView(
            children: [
              NowShowing(),
              ComingSoon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      titleSpacing: 18.w,
      backgroundColor: Const.colorPrimary,
      elevation: 0,
      floating: true,
      snap: true,
      pinned: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Star Movie',
        style: Const.textPrimary,
      ),
      actions: [
        IconButton(
          constraints: BoxConstraints(),
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Image.asset(
            'assets/icon_search.png',
            width: 24.w,
          ),
        ),
        SizedBox(width: 18.w),
      ],
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
                    Tab(text: 'Now Showing'),
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

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      titleSpacing: 18.w,
      toolbarHeight: 90.h,
      backgroundColor: Const.colorPrimary,
      elevation: 0,
      title: Text(
        'Star Movie',
        style: Const.textPrimary,
      ),
      actions: [
        IconButton(
          constraints: BoxConstraints(),
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Image.asset(
            'assets/icon_search.png',
            width: 24.w,
          ),
        ),
        SizedBox(width: 18.w),
      ],
      bottom: PreferredSize(
        preferredSize: new Size(50.0, 50.0),
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
                  Tab(text: 'Now Showing'),
                ],
              ),
              Tab(text: 'Coming Soon'),
            ],
          ),
        ),
      ),
    );
  }
}
