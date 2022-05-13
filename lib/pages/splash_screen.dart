import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/home_page.dart';
import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getNowPlaying() async {
    Provider.of<NowPlayingProvider>(context, listen: false).getNowPlaying();

    Timer(Duration(milliseconds: 3000), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getNowPlaying();
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
