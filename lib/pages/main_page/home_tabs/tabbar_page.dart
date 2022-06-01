import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:movies_app/provider/popular_provider.dart';
import 'package:movies_app/provider/upcoming_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key, required this.child}) : super(key: key);
  final Widget child; // NowPlaying, Upcoming, or Popular

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // call function
    await Provider.of<NowPlayingProvider>(context, listen: false)
        .getNowPlaying();
    await Provider.of<UpcomingProvider>(context, listen: false).getUpcoming();
    await Provider.of<PopularProvider>(context, listen: false).getPopular();

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        header: ClassicHeader(),
        child: Container(
          padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
          child: SingleChildScrollView(
            child: this.widget.child,
          ),
        ),
      ),
    );
  }
}
