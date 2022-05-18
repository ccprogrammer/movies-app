import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/home_page.dart';
import 'package:movies_app/pages/main_page.dart';
import 'package:movies_app/provider/coming_soon_provider.dart';
import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:movies_app/provider/popular_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getData() async {
    await Provider.of<NowPlayingProvider>(context, listen: false)
        .getNowPlaying();
    await Provider.of<UpcomingProvider>(context, listen: false).getUpcoming();
    await Provider.of<PopularProvider>(context, listen: false).getPopular();

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Const.colorSplashScreen, Const.colorSplashScreen2])),
        child: Center(
          child: Image.asset(
            'assets/logo.png',
            width: 108.w,
            height: 184.h,
          ),
        ),
      ),
    );
  }
}
