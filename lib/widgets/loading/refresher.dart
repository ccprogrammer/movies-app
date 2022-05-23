import 'package:flutter/material.dart';
import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:movies_app/provider/popular_provider.dart';
import 'package:movies_app/provider/upcoming_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyRefresher extends StatefulWidget {
  const MyRefresher({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<MyRefresher> createState() => _MyRefresherState();
}

class _MyRefresherState extends State<MyRefresher> {
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
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      header: ClassicHeader(),
      child: widget.child,
    );
  }
}
