import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/main_page/home_tabs/now_playing/now_playing_tab.dart';
import 'package:movies_app/pages/main_page/home_tabs/popular/popular_tab.dart';
import 'package:movies_app/pages/main_page/home_tabs/tabbar_page.dart';
import 'package:movies_app/pages/main_page/home_tabs/upcoming/upcoming_tab.dart';
import 'package:movies_app/provider/movie_detail_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _controller;
  bool silverCollapsed = false;
  String myTitle = "";

  scrollListener() {
    _controller.addListener(() {
      if (_controller.offset > 90 && !_controller.position.outOfRange) {
        if (!silverCollapsed) {
          // do what ever you want when silver is collapsing !

          myTitle = "OneMovies";
          silverCollapsed = true;
          setState(() {});
        }
      }
      if (_controller.offset <= 90 && !_controller.position.outOfRange) {
        if (silverCollapsed) {
          // do what ever you want when silver is expanding !

          myTitle = "";
          silverCollapsed = false;
          setState(() {});
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = ScrollController();

    scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
            controller: _controller,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              _buildSliverAppBar(),
            ],
            body: _buildTabBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() =>
      Consumer<MovieDetailProvider>(builder: (context, data, child) {
        return SliverAppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Const.colorPrimary,
          elevation: 0,
          pinned: true,
          automaticallyImplyLeading: false,
          centerTitle: true,
          expandedHeight: 240,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text(
                  myTitle,
                  style: Const.textPrimary,
                ),
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                data.movieDetail.poster != null
                    ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        imageUrl: data.movieDetail.poster!.toString(),
                        errorWidget: (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                      )
                    : Hero(
                        tag: 'logo',
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Const.colorSplashScreen,
                                Const.colorSplashScreen2
                              ])),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 48),
                              child: Image.asset(
                                'assets/logo.png',
                                width: 42,
                              ),
                            ),
                          ),
                        ),
                      ),
                Positioned(
                  bottom: 90,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Const.appName,
                        style: Const.textPrimary.copyWith(
                          shadows: [
                            Shadow(
                              blurRadius: 15.0,
                              color: Colors.black,
                              offset: Offset(4.0, 4.0),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'find popular movie here',
                        style: TextStyle(
                          fontWeight: Const.medium,
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                          shadows: [
                            Shadow(
                              blurRadius: 15.0,
                              color: Colors.black,
                              offset: Offset(4.0, 4.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
      });

  Widget _buildTabBody() => TabBarView(
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
      );
}
