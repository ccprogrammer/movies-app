import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/pages/splash_screen.dart';
import 'package:movies_app/provider/movie_detail_provider.dart';
import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:movies_app/provider/recommendations_provider.dart';
import 'package:movies_app/provider/reviews_provider.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NowPlayingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SimilarMovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecommendationsProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => ReviewsProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
